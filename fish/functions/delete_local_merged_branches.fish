function delete_local_merged_branches
  git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d
end