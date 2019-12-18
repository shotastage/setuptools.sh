#!/usr/bin/env bash
set -e


##### Functions ##################################################################

function shell_configure {
    if [ -e $HOME/.bash_profile ]; then
        echo "🖊  Adding Bash path..."
        echo "############### setuptools ###############" >> $HOME/.bash_profile
        echo "export PATH=\$PATH:~/.setuptools/bin/" >> $HOME/.bash_profile
        echo "export SETUPTOOLS_BASH_INSTALLATION=OK" >> $HOME/.bash_profile
    fi


    if [ -e $HOME/.bashrc ]; then
        echo "🖊  Adding Bash path..."
        echo "############### setuptools ###############" >> $HOME/.bash_profile
        echo "export PATH=\$PATH:~/.setuptools/bin/" >> $HOME/.bash_profile
        echo "export SETUPTOOLS_BASH_INSTALLATION=OK" >> $HOME/.bash_profile
    fi


    if [ -e $HOME/.config/fish ]; then
        curl -O https://raw.githubusercontent.com/shotastage/setuptools.sh/master/tools/fish_utils.fish
        chmod +x fish_utils.fish
        fish fish_utils.fish
    fi
}

function operating_system {
    if [ "$(uname)" == 'Darwin' ]; then
        OS="macOS"
    elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
        OS="Linux"
    else
        OS="Other"
    fi

    echo $OS
}

function preparation_ubuntu {
    sudo apt-get update -y
    sudo apt-get install git -y
}


##### Check ######################################################################
if [ -e $HOME/.setuptools/bin/ ]; then
    echo "👻 setuptools already installed!"
    exit 1
fi


if [ -e $HOME/.setuptools_installation ]; then
    echo "⚠️  Installation directory already exists!"
    echo "⚠️  Clean existing directory before starting installation."
    rm -rf .setuptools_installation/
fi




##### Main #######################################################################
cd $HOME

# Prepatation
OS=$(operating_system)

# Workspace preparation
mkdir .setuptools_installation
cd .setuptools_installation
git clone https://github.com/shotastage/setuptools.sh.git


# Main Install Process
cd setuptools.sh
mkdir -p $HOME/.setuptools/bin/
mkdir -p $HOME/.setuptools/config/
mv setuptools.sh $HOME/.setuptools/bin/setuptools
mv setuptools-update.sh $HOME/.setuptools/bin/setuptools-update

# Shell Configuration
shell_configure


# Cleaning
echo "🧹  Cleaning..."
cd
rm -rf .setuptools_installation/

# Completed!
echo "🆗  Installation is completed!"
