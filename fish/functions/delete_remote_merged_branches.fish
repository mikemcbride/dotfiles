function delete_remote_merged_branches
  git fetch origin
  git remote prune origin
  git branch -r --merged origin/master | awk -F'/' '/^ *origin/{if(!match($0, /(>|master)/)){print $2}}' | xargs git push origin --delete
end