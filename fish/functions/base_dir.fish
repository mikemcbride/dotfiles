function base_dir --description 'prints the current directory, replaces $HOME with ~'
  # replace $HOME with ~
  set realhome ~
  set tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
  echo -n (basename $tmp)
end
