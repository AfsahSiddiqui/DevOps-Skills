# Integrating Docker Container Logs with AWS CloudWatch

In this lab, we will be monitoring Docker container running within AWS EC2 server via AWS CloudWatch

### Prerequisites

- Have docker installed on your EC2 server

### Steps to Follow
- Run a Docker container e.g. " docker run -d --name my-container -p 80:80 nginx"
- Download the CloudWatch agent package in your EC2 server "wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb"
- Install the CloudWatch agent "sudo dpkg -i amazon-cloudwatch-agent.deb"
- Check the version of cloudwatch agent to confirm the installation "/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent --version"
- [](files/config-docker-awscloudwatch.json)
