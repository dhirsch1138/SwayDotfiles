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
  sh ~/bin/dotfiles_reportchanges.sh $dotfiles_path
  toolbox enter $toolbox_default
  openedtoolbx="true"
fi
