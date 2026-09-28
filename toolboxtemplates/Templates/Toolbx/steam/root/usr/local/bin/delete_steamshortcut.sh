# copy the steam.desktop app up out of the container
rm $HOME/../../.local/share/applications/steam_toolbox.desktop
flatpak-spawn --host update-desktop-database $HOME/../../.local/share/applications
stow -t /home/$USER/.local/share/icons -d ~/.local/share/ -D icons
