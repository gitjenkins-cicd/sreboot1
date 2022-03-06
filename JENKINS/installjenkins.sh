#/bin/bash
echo  "Building Jenkins file"

docker build -t gcr.io/gcp0tohero/jenkinsmasterimage:v1 .

echo "Running  Jenkins on 80 port"

docker run -d -p 80:8080 gcr.io/gcp0tohero/jenkinsmasterimage:v1

contid=$(docker ps|awk -F ' ' '{print $1}'|tail -1)

#gsutil cp -r gs://jenkinsfile/fullback.zip .

docker cp fullback.zip $contid:/home/

docker exec -it $contid sh -c "unzip /home/fullback.zip -d /home/"


