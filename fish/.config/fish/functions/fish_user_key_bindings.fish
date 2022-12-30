function fish_user_key_bindings
  # bind ctrl-f to tmux-sessionizer
  bind -M insert \cf "tmux-sessionizer; commandline -f repaint"

  # bind ctrl-g to tmux-session-switcher
  bind -M insert \cg "tmux-session-switcher; commandline -f repaint"

  # bind ctrl-k to tmux-session-killer
  bind -M insert \ck "tmux-session-killer; commandline -f repaint"
end
