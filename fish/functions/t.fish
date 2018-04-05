function t
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 30 -L ${1:-3} -aC $2
end