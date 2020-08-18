#!/bin/bash

source config

export FILTER_TAGS="tags.items=$VM_TAG_NAME"
export FILTER_LABEL_BOSH_DIRECTOR="labels.deployment:p-bosh"

echo "Initiating START for The Bosh Director within zone=$ZONE1 with vm tag=$VM_TAG_NAME"
gcloud --format=json compute instances list \
  --filter="(zone:( $ZONE1 ))($FILTER_TAGS)($FILTER_LABEL_BOSH_DIRECTOR)" | jq \
   -r .[].name | xargs gcloud compute instances start --zone=$ZONE1

sleep 10

echo "Initiating START for instances within zone=$ZONE1 with vm tag=$VM_TAG_NAME"
gcloud --format=json compute instances list \
  --filter="(zone:( $ZONE1 ))($FILTER_TAGS)" | jq \
   -r .[].name | xargs gcloud compute instances start --zone=$ZONE1 --async

echo "Initiating START for instances within zone=$ZONE2 with vm tag=$VM_TAG_NAME"
gcloud --format=json compute instances list \
  --filter="(zone:( $ZONE2 ))($FILTER_TAGS)" | jq \
   -r .[].name | xargs gcloud compute instances start --zone=$ZONE2 --async

echo "Initiating START for instances within zone=$ZONE3 with vm tag=$VM_TAG_NAME"
gcloud --format=json compute instances list \
  --filter="(zone:( $ZONE3 ))($FILTER_TAGS)" | jq \
   -r .[].name | xargs gcloud compute instances start --zone=$ZONE3 --async

exit 0