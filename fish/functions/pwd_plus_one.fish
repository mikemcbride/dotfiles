function pwd_plus_one --description 'prints current working directory plus one level up and replaces $HOME with ~'
  # replace $HOME with ~
  set realhome ~
  set tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
  set dirs_arr (string split '/' $tmp)
  set dirs_len (count $dirs_arr)
  
  if test $dirs_len -le 2
    # directory path is less than or equal to 2
    # just print it out
    echo -n $tmp
  else
    for i in (seq $dirs_len)
      if test $i -eq (math $dirs_len - 1)
        echo -n $dirs_arr[$i]
      else if test $i -eq $dirs_len
        echo -n "/$dirs_arr[$i]"
      end
    end
  end
end