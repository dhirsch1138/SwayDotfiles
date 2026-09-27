for directory in */
do
  directory="${directory%/}"
  image=$(echo "$directory" | tr '[:upper:]' '[:lower:]'):latest
  echo Building $image from $directory
  podman build --squash --tag $image $directory --cache-to localhost/build/cache --cache-from localhost/build/cache
  echo Running ondelete script for $directory
  toolbox run -c $directory /usr/local/bin/ondelete.sh
  echo Stopping container $directory
  podman stop $directory
  echo Giving container a five seconds to stop...
  sleep 5
  echo Deleting container $directory
  toolbox rm $directory
  echo Create container $directory
  toolbox create $directory -i $image
  echo Running oncreate script for $directory
  toolbox run -c $directory /usr/local/bin/oncreate.sh 
done
echo Pruning old images
podman image prune --all --force
