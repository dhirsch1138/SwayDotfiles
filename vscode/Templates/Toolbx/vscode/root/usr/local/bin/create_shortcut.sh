BOX1=$(grep -oP "(?<=name=\")[^\";]+" /run/.containerenv)
# copy the steam.desktop app up out of the container
cp /usr/share/applications/com.microsoft.VSCode.desktop $HOME/../../.local/share/applications/com.microsoft.VSCode.desktop
cp /usr/share/applications/com.microsoft.VSCode.UrlHandler.desktop $HOME/../../.local/share/applications/com.microsoft.VSCode.UrlHandler.desktop
sed -i "s|Exec=/usr/share/code/code|Exec=toolbox run -c \"$BOX1\" code|g" $HOME/../../.local/share/applications/com.microsoft.VSCode.desktop
sed -i "s|Exec=/usr/share/code/code|Exec=toolbox run -c \"$BOX1\" code|g" $HOME/../../.local/share/applications/com.microsoft.VSCode.UrlHandler.desktop
cd /tmp
wget https://code.visualstudio.com/assets/branding/visual-studio-code-icons.zip
unzip visual-studio-code-icons.zip
cp ./visual-studio-code-icons/vscode.svg $HOME/../../.local/share/icons/vscode.svg
rm -r ./visual-studio-code-icons
flatpak-spawn --host update-desktop-database $HOME/../../.local/share/applications
