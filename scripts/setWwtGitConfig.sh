# execute this script from ~/wwt/github directory
# it will cd into each repo and set the git config info to be wwt email
for d in */*/; do
  cd $d;
  git config user.name "Mike McBride";
  git config user.email "mike.mcbride@wwt.com";
  cd ../..;
done
