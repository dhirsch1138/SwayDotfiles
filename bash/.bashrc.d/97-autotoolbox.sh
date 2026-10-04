if ! [[ $- == *i* ]]
then
  echo is not interactive > /dev/null
elif [[ $(istoolbx) ]]
then
  echo "Current toolbx : $(istoolbx)"
elif [[ $openedtoolbx ]]
then
  echo "client shell > $(hostname)"  
else
  # this will only run in interactive shells
  declare local dotfiles_path=~/dotfiles
  declare local currentworkingdirecory=$(pwd)
  declare local toolbox_default=default.interactive
  cd $dotfiles_path
  git ls-files --full-name --modified --others --exclude-standard | grep -i bash > /dev/null && echo Warning: untracked bash changes detected
  cd $currentworkingdirectory
  toolbox enter $toolbox_default
  openedtoolbx="true"
fi
