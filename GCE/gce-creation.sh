echo "##########Creating compute instance###########"
echo "please enter name of the GCE VM: "
read gcevm
echo "Please enter the name of the project to make", $gcevm, "live"
read proj

gcloud compute instances create $gcevm --project=$proj --zone=asia-south1-c --machine-type=e2-medium --network-interface=network-tier=PREMIUM,subnet=default --metadata=enable-oslogin=TRUE,startup-script=yum\ update\ -y$'\n'yum\ install\ git\ -y$'\n'yum\ install\ docker\ -y$'\n'systemctl\ start\ docker$'\n'yum\ install\ wget\ unzip\ -y$'\n'wget\ https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip$'\n'mv\ terraform_0.12.2_linux_amd64.zip\ /usr/local/bin/$'\n'cd\ /usr/local/bin/$'\n'unzip\ terraform_0.12.2_linux_amd64.zip$'\n'git\ clone\ https://github.com/shakeerdcm/gcp0tohero.git$'\n'cd\ gcp0tohero/NGINXGCR$'\n'sh\ install.sh$'\n'docker\ run\ -d\ -p\ 80:80\ gcr.io/gcp0tohero/my-web-server:v1 --maintenance-policy=MIGRATE --service-account=912494784009-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server,https-server --image=centos-7-v20210817 --image-project=centos-cloud --boot-disk-size=20GB --boot-disk-type=pd-balanced --boot-disk-device-name=instance-1 --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any

publicip=$(gcloud compute instances list |grep -i running|awk -F ' ' '{print $5}')
echo "The gcp0toherocamp website can be accessed at: " http://$publicip:80
