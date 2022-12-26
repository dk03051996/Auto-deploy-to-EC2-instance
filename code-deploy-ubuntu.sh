#!/bin/bash
sudo apt update
sudo apt install -y ruby-full
sudo apt-get install wget
sudo wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto > /tmp/logfile
sudo service codedeploy-agent stop
sudo sed -i 's/""/"ubuntu"/g' /etc/init.d/codedeploy-agent
sudo systemctl daemon-reload
sudo chown ubuntu:ubuntu -R /opt/codedeploy-agent/
sudo chown ubuntu:ubuntu -R /var/log/aws/
sudo service codedeploy-agent start
sudo service codedeploy-agent status
