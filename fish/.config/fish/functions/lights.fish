function lights
  # I have 2 litra lights, so I have to run the command with each serial number.
  # The command can be "on", "off", or "toggle".
  # There are other commands such as brightness and temperature, but I don't need those.
  # If the command is not one of the three that I use, print the help statement instead.
  if test -z $argv[1]
    set -f cmd "toggle"
  else
    set -f cmd $argv[1]
  end
  if test $cmd != "on" -a $cmd != "off" -a $cmd != "toggle"
    echo "Usage: lights [on|off|toggle]"
    litra --help
    return
  end
  litra $cmd -s 2348FE000Y68
  litra $cmd -s 2348FE000YM8
end

