These dotfiles are intended to be managed with GNU stow:
* stow <directory>
  * create symlinks for the directory in the parent folder (which should be home)
* stow -D <directory>
  * un-stows the directory, removing symlinks from the parent folder (which should be home)

This directory should be a non-hidden folder in the home folder.

Recommended "~\dotfiles\"


BASH is read only
* to lock == chmod -w bash -R
* to unlock == chmod +w bash -R
