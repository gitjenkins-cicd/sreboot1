echo "##########Deleting GKE Cluster ###########"
echo "please enter name of the GKE Cluster to be deleted: "
read gkec
echo "Please enter the name of the project where GKE cluster is hosted"
read proj
echo "Please reconfirm by typing delete to destroy GKE cluster: ", $gkec, "in project", $proj

read confirm

if [ $confirm = delete ]
then
echo "executing deletion script"

gcloud beta container --project "$proj" clusters delete $gkec --zone "us-central1-c"

else
echo "User not confirmed on deletion of gke"
fi
