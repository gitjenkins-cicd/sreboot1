echo "##########Creating GKE Cluster ###########"
echo "please enter name of the GKE Cluster: "
read gkec
echo "Please enter project where GKE cluster to be made up"
read proj
gcloud beta container --project "$proj" clusters create $gkec --zone "us-central1-c" --no-enable-basic-auth --cluster-version "1.20.8-gke.2100" --release-channel "regular" --machine-type "e2-micro" --image-type "COS_CONTAINERD" --disk-type "pd-standard" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/cloud-platform" --max-pods-per-node "110" --num-nodes "2"  --enable-ip-alias --network "projects/gcp0tohero/global/networks/default" --subnetwork "projects/gcp0tohero/regions/us-central1/subnetworks/default" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --enable-shielded-nodes --node-locations "us-central1-c"

####Deploying kubernetes deployment files to GKE ############
kubectl create -f deployment1.yml
eip=$(kubectl get svc|grep nginx|awk -F ' ' '{print $4}')

echo "website can be accessed at: ", http://$eip:80
