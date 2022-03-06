#/bin/bash
yum update -y
yum install git -y
yum install docker -y
systemctl start docker
yum install wget unzip -y
wget https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip
mv terraform_0.12.2_linux_amd64.zip /usr/local/bin/
cd /usr/local/bin/
unzip terraform_0.12.2_linux_amd64.zip
git clone https://github.com/shakeerdcm/gcp0tohero.git
cd gcp0tohero/NGINXGCR
sh install.sh
docker run -d -p 80:80 gcr.io/gcp0tohero/my-web-server:v1
