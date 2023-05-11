function reload_kitty
  kill -SIGUSR1 $(pgrep -a kitty)
end
