#!/bin/bash

#check if you are  root user or not

sudo apt update -y
sudo apt-get install apache2
sudo service apache2 start 
	
#Script to check if apache servr is running or not start if not running 
ps cax | grep httpd
if [ $? -eq 0 ]; then
	 echo "Process is running."
 else
	  echo "Process is not running.Starting  apache"
	   sudo service apache2 start
  fi
