# Creating backup via Docker

This practical lets you create a backup of either a directory in your local machine or of a docker container.

- Dockerfile synchronizes the source folder with backup, so when the container is up and running, it synchronizes the two folders.
- backup.sh gives you an option to either backup a directory on local machine or a docker container.

### Steps to Follow

- docker build -t backup_tool:latest .
- to backup a directory on local machine "./backup.sh host"
- or to backup volumes from running container "./backup.sh container"
