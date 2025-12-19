#!/bin/bash
# disk_monitor.sh - checks root filesystem usage and logs/alerts when > THRESHOLD

THRESHOLD=80
LOGFILE="/var/log/disk-usage.log"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Get usage percentage of root (or change "/" to the filesystem you want)
USAGE=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

# If you want to check multiple mounts uncomment and use the loop below: 
# df -P  | awk 'NR>1 {gsub("%","",$5); print $6, $6}' | while read MOUNT PCT; do
# ... handle each $MOUNT and $PCT ...
# done

if [ -z "$USAGE" ]; then
	echo "$DATE ERROR: Could not determine disk usage." >> "$LOGFILE"
	exit 2
fi

if [ "$USAGE" -ge "$THRESHOLD" ]; then 
	MSG="$DATE ALERT: Disk usage is ${USAGE}% (threshold ${THRESHOLD}%) ON /"
	echo "$MSG" >> "$LOGFILE"

	# Optional: send to syslog
	logger -t disk_monitor "$MSG"

	# Optional: send email (requires mailx or sendmail configured)
	# echo "$MSG" | mailx -s "Disk usage alert on $(hostname)" you@example.com 
	
	exit 0 
else 
	echo "$DATE OK: Disk usage is ${USAGE}% on /" >> "$LOGFILE"
	exit 0
fi
