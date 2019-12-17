#!/usr/bin/env bash
set -e

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


# Check
if [ -e $HOME/.setuptools/bin/ ]; then
    echo "👻 setuptools already installed!"
    exit 1
fi


if [ -e $HOME/.setuptools_installation ]; then
    echo "⚠️  Installation directory already exists!"
    echo "⚠️  Clean existing directory before starting installation."
    rm -rf .setuptools_installation/
fi


#In HOME root directory
cd $HOME

mkdir .setuptools_installation
cd .setuptools_installation
git clone https://github.com/shotastage/setuptools.sh.git

# In clone directory
cd setuptools.sh
mkdir -p $HOME/.setuptools/bin/
mkdir -p $HOME/.setuptools/config/
mv setuptools.sh $HOME/.setuptools/bin/setuptools
mv setuptools-update.sh $HOME/.setuptools/bin/setuptools-update


shell_configure



echo "🧹  Cleaning..."
cd
rm -rf .setuptools_installation/
echo "🆗  Installation is completed!"
