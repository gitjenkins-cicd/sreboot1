FROM centos
MAINTAINER Shakeer Ahmed "Shakeer@ahmed.com"
RUN yum install -y  python3-pip python34 --skip-broken
COPY ./requirements.txt /requirements.txt
WORKDIR /
RUN pip3 install -r requirements.txt
COPY . /
ENTRYPOINT [ "python3" ]
CMD [ "webui-db-flask.py" ]
