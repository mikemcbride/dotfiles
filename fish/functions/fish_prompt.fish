function fish_prompt
  # blue working directory
  set_color blue
  echo -n (prompt_pwd)
  
  # get the current git branch
  set -l branch (vcprompt -f '%b')
  
  if test $branch != ''
    set -l gitstatus (vcprompt -f '%m')
    # we have a git branch
    if test $gitstatus
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
