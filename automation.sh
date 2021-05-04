
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


sudo update-rc.d apache2 enable 

#to creat a TAr file and upload it into S3 Bucket
name="ParthaSarathi"
BucketName="upgrad-parthasarathi"
timestamp=$(( date '+%d%m%Y-%H%M%S' ) )

cd  /var/log/apache2/ 
tar -czvf ${name}-httpd-logs-${timestamp}.tar access.log error.log
cp  ${name}-httpd-logs-${timestamp}.tar /tmp 
aws s3 \
	cp /tmp/${name}-httpd-logs-${timestamp}.tar \
	s3://${BucketName}/${name}-httpd-logs-${timestamp}.tar

