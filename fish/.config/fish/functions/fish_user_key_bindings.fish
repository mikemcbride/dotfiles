function fish_user_key_bindings
  # bind ctrl-f to tmux-sessionizer
  bind -M insert \cf "tmux-sessionizer"

  # bind ctrl-g to tmux-session-switcher
  bind -M insert \cg "tmux-session-switcher"

  # bind ctrl-k to tmux-session-killer
  bind -M insert \ck "tmux-session-killer"
end
