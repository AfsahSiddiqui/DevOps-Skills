# Creating backup via Docker

This practical lets you create a backup of either a directory in your host machine or of a docker container.

- Dockerfile synchronizes the source folder with backup when the container is up and running
- backup.sh gives you an option to either backup a directory on host machine or a docker container.

### Steps to Follow

- Build the docker image: "docker build -t backup_tool:latest ."
- to backup a directory on host machine "./backup.sh host path/to/directory"
- or to backup volumes from running container "./backup.sh container container-name"

### Automate the backup
To automate the backup, we can use Cron
- Open the Cron configuration file by running "crontab -e"
- Add the following line to schedule the script to run for backing up on host machine daily at midnight:
0 0 * * * /path/to/backup.sh host /path/to/directory >> /var/log/backup.log 2>&1
- Alternativelym add the following line to schedule for backing up running container daily at midnight:
0 0 * * * /path/to/backup.sh container container-name >> /var/log/backup.log 2>&1
