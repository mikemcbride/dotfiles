function vim
  if not set -q argv[1]
    nvim .
  else
    nvim $argv
  end
end
