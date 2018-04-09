function gpub
  set -l current_branch (vcprompt -f '%b')
  git push --set-upstream origin $current_branch:$current_branch
end