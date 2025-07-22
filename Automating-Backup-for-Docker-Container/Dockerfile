FROM ubuntu:latest

# install the rsync tool
RUN apt-get update && apt-get install -y rsync

# Backup everything from /source to /backup
CMD rsync -av /source/ /backup/

