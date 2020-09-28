function delete_local_merged_branches
    set -l default_branch (git_default_branch)
    git branch --merged $default_branch | grep -v "^*" | grep -v "$default_branch" | xargs git branch -d
end
