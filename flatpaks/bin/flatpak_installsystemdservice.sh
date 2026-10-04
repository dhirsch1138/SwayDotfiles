systemctl enable --user query-flatpaks.timer
systemctl start --user query-flatpaks.timer
if [[ $(systemctl status --user query-flatpaks.timer) ]]
then
	exit 0
else
	exit 1
fi
