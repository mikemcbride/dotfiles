function fish_prompt
  # blue working directory
  set_color blue
  
  # function to get current working directory plus one level up
  echo -n (pwd_plus_one)
  
  # get the current git branch, using vcprompt (installed via homebrew)
  set branch (vcprompt -f '%b')
  
  if test -n "$branch"
    # we have a git branch

    set gitstatus (vcprompt -f '%m')
    set_color brblack

    if test -n "$gitstatus"
      # git status is dirty
      set branch_prompt "$branch*"
    else
      # git status is clean
      set branch_prompt "$branch"
    end
    
    # now that we have set our color, print the git branch.
    echo -n " [$branch_prompt]"
  end
  
  set_color purple
  echo -n " ❯ "
  set_color normal
end
