alias istoolbx='[ -f "/run/.toolboxenv" ] && grep -oP "(?<=name=\")[^\";]+" /run/.containerenv'
# toolbxes can call these commands for host
if [[ $- == *i* && $(istoolbx) ]]; then
  alias rpm-ostree="flatpak-spawn --host rpm-ostree"
  alias flatpak="flatpak-spawn --host flatpak"
  alias shutdown="flatpak-spawn --host shutdown"
fi

toolbox_default=default.interactive
dotfiles_path='dotfiles'
