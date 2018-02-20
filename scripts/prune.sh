# runs node-prune in all directories within the current directory

for d in */; do
  echo "pruning files in $d";
  cd $d;
  node-prune;
  cd ..;
  echo "------------------"
done
