function gcm --description 'git checkout default branch'
    set -l default_branch (git_default_branch)
    git checkout $default_branch
end
