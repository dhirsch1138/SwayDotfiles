declare local currentworkingdirecory=$(pwd)
cd ~
cd $1
git ls-files --full-name --modified --others --exclude-standard | grep -i bash > /dev/null && echo Warning: untracked bash changes detected
git ls-files --full-name --modified --others --exclude-standard | grep -i systemd > /dev/null && echo Warning: untracked systemd changes detected
cd $currentworkingdirectory
