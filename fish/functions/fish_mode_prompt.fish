function fish_mode_prompt --description 'override builtin fish_mode_prompt'
  # this override is here so that in fish_vi_mode, the annoying mode indicator goes away.
  # without this override, you will see an indicator to the left of the prompt showing which vi mode you are in.
end