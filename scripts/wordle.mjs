#!/usr/bin/env node
import { readFile } from 'fs/promises'
import { green } from 'kleur/colors'
const words = JSON.parse(await readFile(new URL('./wordle/word-data.json', import.meta.url)))
const input = process.argv[2]

if (!input || input === '--help') {
    console.log(`usage:
    $ wordle [guesses]

    where [guesses] is a comma-separated list of words (no spaces).
      - lowercase letters for incorrect letters (gray tiles)
      - uppercase letters for correct guesses in the wrong spot (yellow tiles)
      - uppercase prefixed with _ for correct letters in the correct spot (green tiles)

    example:
        $ wordle shakE,B_EiNg

    explanation of that input:
        - S, H, A, and K are gray tiles. E is a yellow tile.
        - B is a yellow tile, E is a green tile, I is a gray tile, N is a yellow tile, and G is a gray tile.
    `)
} else {
    getBestGuess(input)
}

function getBestGuess(data) {
    // set up our data. we need all the words, with more common words first in the array.
    // those are more likely to be correct, so we'll show them first as suggestions.
    // we'll also sort common and other words by number of unique letters, since these
    // are more favorable words to play if still available. So the final order will be:
    // 1. common words, sorted by unique letter count
    // 2. uncommon words, sorted by unique letter count
    // This still keeps more common words first since they're more likely, but also accounts for double letters.
    const sortedPossible = words.possible.sort((a, b) => uniqueLetters(b) - uniqueLetters(a))
    const sortedCommon = words.common.sort((a, b) => uniqueLetters(b) - uniqueLetters(a))
    const sortedOther = words.other.sort((a, b) => uniqueLetters(b) - uniqueLetters(a))
    let availableWords = Array.from(new Set([...sortedPossible, ...sortedCommon, ...sortedOther]))
    // split our guesses by comma
    let guesses = data.split(',')
    // we'll keep track of a few things as we loop through these guesses:
    // 1. correct letters will be stored as a map. the letter will be the key, the value will be an array of indices.
    // 2. correct placement will be stored as an array of `letter:index` values.
    // 3. incorrect letters are stored in an array.
    // 4. no doubles - if we guess a word with double letters and it's correct once but incorrect the second time, we know that word only has the letter once.
    //    We'll keep track of this so we can filter out any words that have that letter more than once.
    let correctLetters = {}
    let correctPlacement = []
    let incorrectLetters = []
    let noDoubles = []

    // loop through guesses, grabbing the correct letters and incorrect letters
    for (let guess of guesses) {
        let letters = guess.split('')
        let nextLetterCorrectPlace = false
        let idx = 0
        for (let letter of letters) {
            if (nextLetterCorrectPlace === true) {
                nextLetterCorrectPlace = false
                // avoid pushing it in multiple times
                if (!correctPlacement.includes(`${letter.toLowerCase()}:${idx}`)) {
                    correctPlacement.push(`${letter.toLowerCase()}:${idx}`)
                }
                idx++
            } else if (letter === '_') {
                nextLetterCorrectPlace = true
            } else {
                nextLetterCorrectPlace = false
                if (letter === letter.toUpperCase()) {
                    // letter is correct
                    // I could do something to handle correct double letter guesses...
                    // but that logic gets REAL nasty real quick. I'm not gonna mess with it yet.
                    if (!correctLetters[letter.toLowerCase()]) {
                        correctLetters[letter.toLowerCase()] = []
                    }
                    // push the index so we know where the letter is NOT - this will help us further refine our list,
                    // rather than simply guessing the letter in a spot we know is incorrect.
                    correctLetters[letter.toLowerCase()].push(idx)
                } else {
                    // if this letter is already in correctLetters,
                    // then it was a double letter guess and is incorrect.
                    // we can eliminate words with double letters
                    if (correctLetters[letter] || correctPlacement.some(x => x.startsWith(letter.toLowerCase()))) {
                        noDoubles.push(letter)
                    } else {
                        if (!incorrectLetters.includes(letter.toLowerCase())) {
                            incorrectLetters.push(letter.toLowerCase())
                        }
                    }
                }
                idx++
            }
        }
    }
    // filter out words that have letters we know aren't possible
    availableWords = availableWords.filter(word => {
        // if the word doesn't have a correct placement letter where we know one exists, it can't be right.
        if (!correctPlacement.every(pair => {
            const [l, i] = pair.split(':')
            return word[i] === l
        })) {
            return false
        }
        // if the word contains an incorrect letter, it can't be right.
        if (incorrectLetters.some(letter => word.includes(letter))) {
            return false
        }
        // if the word is missing a letter we know is in the word, it can't be right.
        if (!Object.keys(correctLetters).every(letter => word.includes(letter))) {
            return false
        }
        // if the word has multiple instances of a letter and we know it only has one, it can't be right.
        if (noDoubles.some(letter => countLettersInWord(word, letter) > 1)) {
            return false
        }
        // finally, check letter placement for correct letters
        // we do this last because it's the most inefficient operation to test for.
        for (let letter of Object.keys(correctLetters)) {
            let indices = correctLetters[letter]
            for (let index of indices) {
                if (word[index] === letter) {
                    return false
                }
            }
        }
        return true
    })
    console.log('Number of possible words remaining:', availableWords.length)
    if (availableWords.length === 1) {
        console.log('The word is:', green(availableWords[0]))
    } else {
        console.log('My next guess would be:', green(availableWords[0]))
        console.log('Some other good choices:', green(availableWords.slice(1, Math.min(availableWords.length, 11)).join(', ')))
    }
}

function countLettersInWord(word, letter) {
    let count = 0
    let letters = word.split('')
    for (let l of letters) {
        if (l === letter) {
            count++
        }
    }
    return count
}

function uniqueLetters(word) {
    let letters = word.split('')
    let unique = Array.from(new Set(letters))
    return unique.length
}
