function ab
  if test -n "$argv"
    atom-nightly $argv
  else
    atom-nightly .
  end
end
