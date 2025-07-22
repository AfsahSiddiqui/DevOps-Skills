#!/bin/bash

# Set target to backup: either "host" or a "container"
target=$1 
# Set source to be backed up: either a path to folder or a container name
source=$2  

if [[ -z "$target" || -z "$source" ]]; then
    echo "Usage: $0 [host|container] <source_path_or_container_name>"
    exit 1
fi


# Directory where backups will be stored 
backup_root="/backup_data"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
backup_path="${backup_root}/${timestamp}"

# Name of Docker backup image
backup_tool_image="backup_tool:latest"

mkdir -p "$backup_path"

if [[ "$target" == "host" ]]; then
    # Backup a folder from EC2 (edit path as needed)
    echo "Backing up host path: $source..."
    docker run --rm -v "$source:/source" -v "$backup_path:/backup" "$backup_tool_image"

elif [[ "$target" == "container" ]]; then
    # Backup volumes from another container
    echo "Backing up volumes from container: $source..."
    docker run --rm --volumes-from "$source" -v "$backup_path:/backup" "$backup_tool_image"

else
    echo "Invalid target type: $target"
    echo "Usage: $0 [host|container] <source_path_or_container_name>"
    exit 1
fi

echo "Backup saved at: $backup_path"

