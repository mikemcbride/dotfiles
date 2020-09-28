function delete_remote_merged_branches
    set -l default_branch (git_default_branch)
    git fetch origin
    git remote prune origin
    git branch -r --merged origin/$default_branch | awk -F'/' '/^ *origin/{if(!match($0, /(>|$default_branch)/)){print $2}}' | xargs git push origin --delete
end
