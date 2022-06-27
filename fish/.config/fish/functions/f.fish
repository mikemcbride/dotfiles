function f
    set -l new_dir (find ~ ~/src ~/wwt/github/custom-apps -mindepth 1 -maxdepth 1 -type d | fzf)
    cd $new_dir
end
