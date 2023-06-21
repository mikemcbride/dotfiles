function file_duration
  node ~/.local/bin/chapter-times/index.mjs
  # ffprobe -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $argv 2>/dev/null
end
