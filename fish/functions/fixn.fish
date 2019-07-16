function fixn
  set -l local_node_path (which node)
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --remove $local_node_path;
  sudo codesign --force --sign - $local_node_path;
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add $local_node_path;
end