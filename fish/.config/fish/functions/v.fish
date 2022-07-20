function v
    set -l new_dir (find . -mindepth 1 -maxdepth 1 -type d | fzf)
    cd $new_dir
    nvim
end
