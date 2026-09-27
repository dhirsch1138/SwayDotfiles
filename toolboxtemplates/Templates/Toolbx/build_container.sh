if ! [[ -d $1 ]]
then 
	echo "Directory not found $1 in $(pwd)" >&2
	exit 1
elif ! [[ $2 ]]
then
	echo "No image provided" >&2
	exit 1
else
	echo Running ondelete script for $1
	toolbox run -c $1 /usr/local/bin/ondelete.sh
	echo Stopping container $1
	podman stop $1
  	echo Giving container a five seconds to stop...
  	sleep 5
  	echo Deleting container $1
  	toolbox rm $1
  	echo Create container $1
	if [[ $(toolbox create $1 -i $2) ]]
  	then
		echo Running oncreate script for $1
		toolbox run -c $1 /usr/local/bin/oncreate.sh
		exit 0
	else
		echo Failed to create image from $2 >&2
		exit 1
	fi
fi	
