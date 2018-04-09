function glmm --description 'switch to master, pull from remote, and merge changes into current branch'
  git checkout master
  git pull
  git checkout -
  git merge master
end