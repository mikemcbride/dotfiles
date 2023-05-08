function hst
  set cmd $(history | gum filter | xargs echo -n)
  commandline -r "$cmd"
end
