#!/usr/bin/env node
import { readFile } from 'fs/promises'
import { green } from 'kleur/colors'
import inquirer from 'inquirer'

const words = JSON.parse(await readFile(new URL('./word-data.json', import.meta.url)))

let remainingGuesses = 6

console.log(green('Welcome to wordle-cli!'))
console.log('HOW TO PLAY')
console.log('---------------')
console.log(`For each guess:
      - lowercase letters for incorrect letters (gray tiles)
      - uppercase letters for correct guesses in the wrong spot (yellow tiles)
      - uppercase prefixed with _ for correct letters in the correct spot (green tiles)
`)

const questions = [
    {
        type: 'input',
        name: 'guess',
        message: 'First guess:',
    }, {
        type: 'input',
        name: 'guess',
        message: 'Second guess:',
    }, {
        type: 'input',
        name: 'guess',
        message: 'Third guess:',
    }, {
        type: 'input',
        name: 'guess',
        message: 'Fourth guess:',
    }, {
        type: 'input',
        name: 'guess',
        message: 'Fifth guess:',
    }, {
        type: 'input',
        name: 'guess',
        message: 'Sixth guess:',
    },
]


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

promptQuestion()

function promptQuestion() {
    const questionIndex = 6 - remainingGuesses
    inquirer.prompt(questions[questionIndex]).then(answer => {
        remainingGuesses--;
        getBestGuess(answer.guess)
        if (availableWords.length <= 1 || remainingGuesses === 0) {
            return
        } else {
            console.log('---------------------------------')
            promptQuestion()
        }
    })
}

function getBestGuess(data) {
    parseWord(data)
    // filter out words that have letters we know aren't possible
    availableWords = getRemainingAvailableWords()
    console.log('Number of possible words remaining:', availableWords.length)
    if (availableWords.length === 1) {
        console.log('The word is:', green(availableWords[0]))
    } else {
        console.log('My next guess would be:', green(availableWords[0]))
        console.log('Some other good choices:', green(availableWords.slice(1, Math.min(availableWords.length, 11)).join(', ')))
    }
}

// TODO: refactor this to be able to test words without altering the global state
// I'd like to be able to re-use this function to test each word in the list to find the best guess.
function parseWord(data) {
    let letters = data.split('')
    let nextLetterCorrectPlace = false
    let idx = 0
    for (let letter of letters) {
        //  we use _ to denote correct letters in the correct place, so we need to skip over it
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

function getRemainingAvailableWords() {
    // filter out words that have letters we know aren't possible
    return availableWords.filter(word => {
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
}

// TODO: implement this to provide better sorting for word guesses
// the ideal next guess is the word that eliminates the most possible other words.
// the fastest way to do this is to check all remaining unknown letters in each word,
// then count how many words would be removed if these unknowns are incorrect.
function getOptimalSortOrder(words) {

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
