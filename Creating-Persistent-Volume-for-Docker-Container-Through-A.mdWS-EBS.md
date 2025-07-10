# Creating Persistent Volume For a Docker Container Through AWS EBS

In this lab, we will be utilizing AWS EBS service as peristent volume for a Docker container, which is running on AWS EC2.

### Prerequisites:
Have Docker installed on AWS EC2 server

### Steps to follow:
Download/pull nginx image through the command "docker pull nginx"
Create an EBS volume in the same region that has the EC2 instance
Rename the newly created EBS volume for your own ease

Go back on the EC2 terminal and run command "lsblk", only one volume is showing right now
![](https://github.com/AfsahSiddiqui/DevOps-Skills/blob/main/images/lsblk-bf.png?raw=true)

Now on AWS console, attach the newly created volume to the EC2 server. Note the device name of the volume. Mine is /dev/xvdf
Run the same "lsblk" command, now the newly attached volume will also show up
![](https://github.com/AfsahSiddiqui/DevOps-Skills/blob/main/images/lsblk-aft.png?raw=true)

Format the newly attached volume "mkfs -t ext4 /dev/xvdf"

Create a new repository in the root '/' which you will attach with the volume (e.g. "mkdir /docker-storage")

Now mount the EBS volume "mount /dev/xvdf /docker-storage"

To ensure the volume is remounted after a reboot, we update /etc/fstab
echo '/dev/xvdf /docker-lab ext4 defaults,nofail 0 2' | sudo tee -a /etc/fstab

Run the docker container with newly mounted EBS volume as its persistent storage
docker run --name my-nginx -v /docker-storage:/usr/share/nginx/html:rw -d -p 80:80 nginx

Now the docker-storage on the host machine and /usr/share/nginx/html are synced; whenever you make any changes in one directory, those changes will automatically update the other.

whenever you make changes in the host machine directory, make sure to restart docker conatainer so it is up to date with the changes
docker restart Container-ID
