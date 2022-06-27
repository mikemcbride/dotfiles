# for when the previous command needs sudo...
# equivalent to sudo !! in bash (since !! doesn't work in fish)
function please
    eval command sudo $history[1]
end
