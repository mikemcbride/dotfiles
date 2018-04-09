function t
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 30 -L 3 -aC $argv[2]
end