#!/bin/bash

# Set target to backup: either "host_dir" or a running container
target=$1  # e.g., ./backup.sh host or ./backup.sh container

# Directory where backups will be stored on the EC2 instance
backup_root="/backup_data"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
backup_path="${backup_root}/${timestamp}"

# Name of Docker backup image
backup_tool_image="backup_tool:latest"

# Container to back up (if using container option)
source_container="my_app_container"

mkdir -p "$backup_path"

if [[ "$target" == "host" ]]; then
    # Backup a folder from EC2 (edit path as needed)
    echo "Backing up /home/ubuntu/app-data from EC2..."
    docker run --rm -v /home/ubuntu/app-data:/source -v "$backup_path:/backup" "$backup_tool_image"

elif [[ "$target" == "container" ]]; then
    # Backup volumes from another container
    echo "Backing up volumes from container $source_container..."
    docker run --rm --volumes-from "$source_container" -v "$backup_path:/backup" "$backup_tool_image"

else
    echo "Usage: $0 [host|container]"
    exit 1
fi

echo "Backup saved at: $backup_path"

