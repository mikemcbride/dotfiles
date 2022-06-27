function delete_remote_merged_branches
    set -l default_branch (git_default_branch)
    git fetch origin
    git remote prune origin
    git branch -r --merged $default_branch | grep -v "^*" | grep -v "$default_branch" | sed 's/origin\///' | xargs -n 1 git push --delete origin
end
