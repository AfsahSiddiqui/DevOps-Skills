# Creating Persistent Volume For a Docker Container Through AWS EBS

In this lab, we will be utilizing AWS EBS service as peristent volume for a Docker container, which is running on AWS EC2.

### Prerequisites:
Have Docker installed on AWS EC2 server

### Steps to follow:
Download/pull nginx image through the command "docker pull nginx"
Create an EBS volume in the same region that has the EC2 instance
Rename the newly created EBS volume for your own ease

Go back on the EC2 terminal and run command "lsblk", only one volume is showing right now
!(https://github.com/AfsahSiddiqui/DevOps-Skills/blob/main/images/lsblk-bf.png?raw=true)

Now on AWS console, attach the newly created volume to the EC2 server. Note the device name of the volume. Mine is /dev/xvdf
Run the same "lsblk" command, now the newly attached volume will also show up
![](https://github.com/AfsahSiddiqui/DevOps-Skills/blob/main/images/lsblk-aft.png?raw=true)
