# Purpose
This repo tracks my personal desktop configuration, which utilizes the Sway window manager on top of Fedora Atomic.

## Goals
* Provide a trackable store for the the desktop configuration that can be easily (re)deployed.
* Respects the intent behind the atomic philosophy, meaning:
  * No packages are layered on top of the Sway Fedora Atomic image
  * GUI applications preferentially deployed with *verified* flatpaks from flathub
    * GUI applications that do not have *verified* flatpaks or are otherwise suspect are deployed inside toolboxs
  * TUI applications are deployed inside toolboxes
  * Toolbox deployments for applications are defined as custom container images, and have scripting to deploy and maintain them.

# Installation
- Start with a current installation of Fedora Sway Atomic
- Clone this repo to the home directory for your user, such that this file resides in ~/dotfiles
- Run the toolbox update script: ~/dotfiles/toolboxtemplates/Templates/Toolbx/update_all.sh
  - This will built the defined toolbox images and create toolbox containers for them
- Deploy the configuration
  - Enter the *default.interactive* toolbox using : "toolbox enter default.interactive"
  - Browse to ~/dotfiles
  - Use **stow** on all of the directories in ~/dotfiles
- Optional - enable flatpak update notification by running ~/bin/flatpak_installsystemdservice.sh
- Log out and log back in
  
# Notes

## Stow
These dotfiles are intended to be managed with GNU stow:
* stow <directory>
  * create symlinks for the directory in the parent folder (which should be home)
* stow -D <directory>
  * un-stows the directory, removing symlinks from the parent folder (which should be home)

This directory should be a non-hidden folder in the home folder.

## Detect changes
git ls-files --modified --others --exclude-standard
