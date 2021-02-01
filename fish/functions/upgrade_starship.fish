function upgrade_starship --description 'Upgrade the starship binary'
  curl -fsSL https://starship.rs/install.sh | bash
end
