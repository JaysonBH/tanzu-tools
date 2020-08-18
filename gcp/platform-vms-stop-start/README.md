# Tanzu Tools - Google Cloud

#### Start/Stop GCP TAS VM's:

Scripts that can stop a specific foundation's VM when not in use and to start back up again in an order in which deployments will Bosh heal back to normal.

1. Set your configuration in the [config](config) file.

    ```
    export VM_TAG_NAME="my-platform-vms"
    export ZONE1="us-east1-b"
    export ZONE2="us-east1-c"
    export ZONE3="us-east1-d"
    ```
    
    a. VM_TAG_NAME is the tag you set in ops manager that adds a tag to all VMs deployed by Bosh on your foundation.
    You can obtain this value from terraform with `terraform output env_name`. This is the same value you set on the 
    [GCP config page](https://docs.pivotal.io/platform/ops-manager/gcp/config-terraform.html#gcp-config) of 
    setting up the Director Configuration
    
    b. Add each zone of your foundation as ZONE1, ZONE2, & ZONE3.

2. Execute a Stop:

    ```
    ./stop-platform-vms.sh
    ```

3. Execute a Start:

    ```
    ./start-platform-vms.sh
    ```

