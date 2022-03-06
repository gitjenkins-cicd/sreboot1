FROM jenkins/jenkins:latest
LABEL maintainer="shakeeer@gmail.com"
USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN apt update
RUN apt install wget -y
RUN apt install docker* -y
RUN apt update
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get update
RUN apt install google-cloud-sdk -y
RUN apt install kubectl -y
RUN apt-get install -y lsb-release
RUN apt-get install -y software-properties-common
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg |  apt-key add -
RUN apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update
RUN apt install terraform -y
RUN apt install -y apache2-utils 
RUN apt install -y zip 
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
