function glmm --description 'switch to default branch, pull from remote, and merge changes into current branch'
    set -l default_branch (git_default_branch)
    git checkout $default_branch
    git pull
    git checkout -
    git merge $default_branch
end
