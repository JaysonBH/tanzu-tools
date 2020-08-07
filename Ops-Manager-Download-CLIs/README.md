# om-tools

Simple script to add to Any Opsmanger to download the Pivnet, OM &amp; CF CLI's

1. ssh into your Ops manager.

2. Run the below to Download the tools:

```
cd /home/ubuntu/
git clone https://github.com/JaysonBH/tanzu-tools.git
sudo su -
cd /home/ubuntu/tanzu-tools/Ops-Manager-Download-CLIs
./download_om_tools.sh
exit
```

3. Check and confirm the tools are loaded correctly:

```
pivnet -v
om -v
cf -v
```