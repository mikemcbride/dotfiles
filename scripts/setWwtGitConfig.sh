# execute this script from ~/wwt/github directory
# it will cd into each repo and set the git config info to be wwt email
for d in */*/; do
  cd $d;
  
  # check if we are in a git repo
  # if so, update config
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    git config user.name "Mike McBride";
    git config user.email "mike.mcbride@wwt.com";
	fi
  
  # get back to where we started so the loop doesn't break
  cd ~/wwt/github;
done
