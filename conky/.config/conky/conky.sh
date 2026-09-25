toolbox list --images | grep desktoputilities > /dev/null || podman build --squash --tag localhost/desktoputilities:latest ~/Templates/Toolbx/DesktopUtilities
toolbox list --containers | grep DesktopUtilities > /dev/null || toolbox create DesktopUtilities --image localhost/desktoputilities
toolbox run --container DesktopUtilities sh -c conky -d
