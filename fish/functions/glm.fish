function glm
    set -l default_branch (git_default_branch)
    git checkout $default_branch
    git pull
end
