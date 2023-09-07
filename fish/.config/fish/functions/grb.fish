function grb --description 'git checkout default branch, pull, rebase onto current branch'
  set -l default_branch (git_default_branch)
  git checkout $default_branch
  git pull
  git checkout -
  git rebase -i $default_branch
end
