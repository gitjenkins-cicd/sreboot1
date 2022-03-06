gcloud logging sinks create test --include-children bigquery.googleapis.com/projects/gcp0tohero/datasets/gke_logs_dataset --log-filter="resource.type='k8s_container'"

srvcacct=$(gcloud logging sinks describe test|grep writerIdentity|awk -F ' ' '{print $2}'|awk -F ':' '{print $2}'|awk -F '@' '{print $1}')
srvcacctfull=$(gcloud logging sinks describe test|grep writerIdentity|awk -F ' ' '{print $2}')
gcloud iam service-accounts create $srvcacct --display-name "test svc account" --project=gcp0tohero

gcloud projects add-iam-policy-binding gcp0tohero --member=$srvcacctfull --role=roles/bigquery.dataEditor


