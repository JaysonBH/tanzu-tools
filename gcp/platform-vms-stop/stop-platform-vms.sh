#!/bin/bash

source config

echo Getting a list of all platform VM\'s with tag $TAG
gcloud compute instances list --format=json --filter="tags.items=$VM_TAG_NAME" | jq -r .[].name

exit 0