function c
  if test -n "$argv"
    nvim $argv
  else
    nvim
  end
end
