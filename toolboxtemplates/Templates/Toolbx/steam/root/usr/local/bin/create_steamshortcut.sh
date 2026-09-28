BOX1=$(grep -oP "(?<=name=\")[^\";]+" /run/.containerenv)
# copy the steam.desktop app up out of the container
cp /usr/share/applications/steam.desktop $HOME/../../.local/share/applications/steam_toolbox.desktop
sed -i "s/\/usr\/bin\/steam/toolbox run -c \"$BOX1\" steam/g" $HOME/../../.local/share/applications/steam_toolbox.desktop
sed -i "s/Name=Steam/Name=Steam (\"$BOX1\")/g" $HOME/../../.local/share/applications/steam_toolbox.desktop
flatpak-spawn --host update-desktop-database $HOME/../../.local/share/applications
cp /usr/share/icons/* ~/.local/share/icons -r
stow -t /home/$USER/.local/share/icons -d ~/.local/share/ icons
