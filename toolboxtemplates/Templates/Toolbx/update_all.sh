for directory in */
do
	directory="${directory%/}"
	image=$(echo "$directory" | tr '[:upper:]' '[:lower:]'):latest
	echo Building $image from $directory
	if ! [[ $(podman build --squash --tag $image $directory --cache-to localhost/build/cache --cache-from localhost/build/cache) ]]
	then
		echo Failed to create image $image from $directory >&2
		exit 1
	elif ! [[ $(sh build_container.sh $directory $image) ]]
	then
		echo Failed to build container with $image from $directory >&2
		exit 1
	else
		echo Success
done
echo Pruning old images
podman image prune --all --force
