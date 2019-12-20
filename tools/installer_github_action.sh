#!/usr/bin/env bash
set -e


##### Functions ##################################################################

function shell_configure {
    if [ -e $HOME/.bashrc ]; then
        echo "🖊  Adding Bash path..."
    fi
}


function before_preparation {
    sudo apt-get update -y
    sudo apt-get install git -y
}


##### Check ######################################################################
if [ -e $HOME/.setuptools/bin/ ]; then
    echo "👻 setuptools already installed!"
    exit 1
fi


if [ -e $HOME/.setuptools_installation ]; then
    echo "👻  Installation directory already exists!"
    echo "👻  Clean existing directory before starting installation."
    rm -rf $HOME/.setuptools_installation/
fi




##### Main #######################################################################
cd $HOME

# Prepatation
before_preparation

# Workspace preparation
mkdir .setuptools_installation
cd .setuptools_installation
git clone https://github.com/shotastage/setuptools.sh.git


# Main Install Process
cd setuptools.sh
mkdir -p $HOME/.setuptools/bin/
mkdir -p $HOME/.setuptools/lib/
mkdir -p $HOME/.setuptools/config/
mv ./lib/ $HOME/.setuptools/
cp -f uptool.sh $HOME/.setuptools/bin/uptool
mv uptool-update.sh $HOME/.setuptools/bin/uptool-update

# Shell Configuration
shell_configure


# Cleaning
echo "🧹  Cleaning..."
cd
rm -rf .setuptools_installation/

# Completed!
echo "🆗  Installation is completed!"
