#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Adding Apt Repo for: Google Cloud SDK (gcloud)"

export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key -y add -

echo "(+) Updating Sources & Installing"
sudo apt-get update && sudo apt-get install -y google-cloud-sdk


cat << EOF
(+) Complete! To get started with google-cloud-sdk run:
    $ gcloud init
EOF

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
