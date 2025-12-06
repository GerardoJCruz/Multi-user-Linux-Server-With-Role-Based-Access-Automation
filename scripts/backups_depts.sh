#!/bin/bash

# Backup directory
BACKUP_DIR="/backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
FILE="dept_backup_$DATE.tar.gz"

# Source directory
SOURCE="/dept"

# Create backup
tar -czf $BACKUP_DIR/$FILE $SOURCE 2>/var/log/backup_errors.log

# Optional: Delete backups older than 14 days
find $BACKUP_DIR -type f -mtime +14 -name "*.tar.gz" -exec rm {} \;

# Log Backups for Better monitoring
echo "Backup created on $(date)" >> /var/log/backup.log

