echo "Warning: You have executed deletion script to delete gce instance"
echo "Please enter name of gce instance: "
read gce
echo "Please Enter name of the project: "
read proj
echo "Please type  'delete' to destroy instance: '$gce', in project: '$proj' "

read confirm

if [ $confirm = delete ]
then
echo "executing deletion script"

gcloud compute instances delete $gce --project="$proj" --zone=asia-south1-c

else
echo "You have entered:  '$confirm' ,deletion script expects only 'delete' no other words accepted "
fi
