function zed
  if test -n "$argv"
    open -a "Zed" $argv
  else
    open -a "Zed" $PWD
  end
end
