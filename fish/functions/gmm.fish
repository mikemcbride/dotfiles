function gmm --description 'merge default branch into current branch'
    set -l default_branch (git_default_branch)
    git merge $default_branch
end
