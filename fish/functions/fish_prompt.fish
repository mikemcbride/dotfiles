function fish_prompt
  # blue working directory
  set_color blue
  
  
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
  
  # get the current git branch
  set branch (vcprompt -f '%b')
  
  if test -n "$branch"
    set gitstatus (vcprompt -f '%m')
    # we have a git branch
    if test -n "$gitstatus"
      # git status is dirty
      set_color yellow
    else
      # git status is clean
      set_color brblack
    end
    
    # now that we have set our color, print the git branch.
    echo -n " [$branch]"
  end
  
  set_color purple
  echo -n " ❯ "
  set_color normal
end
