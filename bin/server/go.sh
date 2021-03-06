#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

if [[ -d "/usr/local/go" ]]; then
    echo "(!) Your path /usr/local/go already exists, remove before installing. stopping."
    sleep 4
    exit
fi

echo "(+) Downloading Google Golang 1.9.2 for Linux AMD64"

# Clear any existing tmp GO files
if [[ -d "${PROJECT_TEMP_PATH}/go1*" ]]; then
  rm -rf $PROJECT_TEMP_PATH/go1*
fi

# Download Time!
curl -O https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz $PROJECT_TEMP_PATH
cd $PROJECT_TEMP_PATH

tar xvf $PROJECT_TEMP_PATH/go1.*.tar.gz
rm $PROJECT_TEMP_PATH/go1.*.tar.gz

echo "(+) Moving $PROJECT_TEMP_PATH/go to /usr/local with permissions: root:root"

sudo chown -R root:root $PROJECT_TEMP_PATH/go
sudo mv $PROJECT_TEMP_PATH/go /usr/local


echo "(+) Creating a local ~/go folder for your code. Setting your user permissions."

if [[ ! -d "$HOME/go" ]]; then
    mkdir $HOME_PATH/go
    sudo chown $USER:$USER "$HOME_PATH/go"
fi

echo "(+) Creating a temp file in $PROJECT_TEMP_PATH/append_to_profile.txt"

cat > $PROJECT_TEMP_PATH/append_to_profile.txt <<- EOM
------------------------
-- START INSTRUCTIONS --
------------------------

1: Copy/Paste the text below into:
    ~/.profile
2: Next, apply ENV Variable change  by sourcing:
    $ . ~/profile
3. You should be able to type:
    $ go
    $ go version
----------------------
-- END INSTRUCTIONS --
----------------------



# ---------------------------------------------------
# Google Golang
# ---------------------------------------------------

# Add Go to our path if it exists
if [[ -d "/usr/local/go/bin" ]]; then
    PATH=\$PATH:/usr/local/go/bin
fi

# Include Google go default path if installed
if [[ -d "\$HOME/go" ]]; then
    export GOPATH=\$HOME/go
fi
EOM

echo "Creating Sample Go Project in /go/sample.go"
# Create sample project


cat > $HOME_PATH/go/sample.go <<- EOM
package main

import "fmt"

func main() {
    fmt.Printf("hello, world")
}
EOM


echo "(+) Complete! Go was installed!"
echo "(!) Required: Read the instructions in this file to finish setup:"
echo "      $ cat $PROJECT_TEMP_PATH/append_to_profile.txt"
echo "      $ source ~/.profile"
echo ""
echo "(!) Then attempt to build the Hello World item:"
echo "      $ cd ~/go/ && go build sample && ./sample"
echo ""
echo "(!) If you have issues, please check the following:"
echo "       $ which go"
echo "       $ echo \$GOPATH"
echo "    Nethier of those should be empty."
echo "       $ tail ~/.profile   -- Did you add to your ~/.profile and source it?"
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 6
fi

