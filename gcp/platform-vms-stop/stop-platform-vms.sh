#!/bin/bash

source config

export FILTER="tags.items=$VM_TAG_NAME"

echo "Initiating STOP for instances within zone=$ZONE1 with vm tag=$VM_TAG_NAME"
gcloud --format=json compute instances list \
  --filter="(zone:( $ZONE2 ))($FILTER)" | jq \
   -r .[].name | xargs gcloud compute instances stop --zone=$ZONE2 --async

echo "Initiating STOP for instances within zone=$ZONE2 with vm tag=$VM_TAG_NAME"
gcloud --format=json compute instances list \
  --filter="(zone:( $ZONE2 ))($FILTER)" | jq \
   -r .[].name | xargs gcloud compute instances stop --zone=$ZONE2 --async

echo "Initiating STOP for instances within zone=$ZONE3 with vm tag=$VM_TAG_NAME"
gcloud --format=json compute instances list \
  --filter="(zone:( $ZONE3 ))($FILTER)" | jq \
   -r .[].name | xargs gcloud compute instances stop --zone=$ZONE3 --async

exit 0