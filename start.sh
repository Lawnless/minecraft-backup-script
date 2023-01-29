#!/bin/bash

# Variables
BACKUP_FOLDER="./backups"
WORLD_FOLDER="./world"
TIMESTAMP=$(date +%Y-%m-%d-%T)
MC_SERVER_EXEC="./minecraft_server.jar"

# Make backup folder if it doesn't exist
if [ ! -d "$BACKUP_FOLDER" ]; then
  mkdir "$BACKUP_FOLDER"
fi

# Compress the world folder into a tar archive
tar -cvzf "$BACKUP_FOLDER/minecraft-world-$TIMESTAMP.tar.gz" "$WORLD_FOLDER"

# Upload the backup to Google Drive
gdrive upload "$BACKUP_FOLDER/minecraft-world-$TIMESTAMP.tar.gz"

# Log the backup
echo "Minecraft server world backed up to Google Drive: minecraft-world-$TIMESTAMP.tar.gz"

# Start the Minecraft server
java -jar "$MC_SERVER_EXEC"
