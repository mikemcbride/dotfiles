function unstage --description 'Unstage staged files' --wrap 'git reset' 
  git reset -- $argv
end
