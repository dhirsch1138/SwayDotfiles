rm $HOME/../../.local/share/applications/com.microsoft.VSCode.desktop
rm $HOME/../../.local/share/applications/com.microsoft.VSCode.UrlHandler.desktop
rm $HOME/../../.local/share/icons/vscode.svg
flatpak-spawn --host update-desktop-database $HOME/../../.local/share/applications/
