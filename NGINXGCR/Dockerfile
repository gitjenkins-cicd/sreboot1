FROM centos:7
MAINTAINER "Shakeer Ahmed"
RUN yum -y install epel-release
#RUN yum -y update
RUN yum -y install nginx
ADD index.html /usr/share/nginx/html/index.html
ADD image.jpeg /usr/share/nginx/html
EXPOSE 80/tcp
CMD ["nginx", "-g daemon off;"]
