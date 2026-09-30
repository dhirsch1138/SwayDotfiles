if [[ $(istoolbx) ]]
then
  echo "Current toolbx : $(istoolbx)"
elif [[ $openedtoolbx ]]
then
  echo "client shell > $(hostname)"  
elif [[ $- == *i* ]]
then
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
