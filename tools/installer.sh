#!/usr/bin/env bash
set -e

echo
echo "THIS INSTALLER IS OLD VERSION!"
echo "Please try new installer running below."
echo "bash <(curl -sL https://2oo.pw/eMFfU)"
exit 1


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
mv setuptools.sh $HOME/.setuptools/bin/setuptools
mv setuptools-update.sh $HOME/.setuptools/bin/setuptools-update



if [ -e $HOME/.bash_profile ]; then
    echo "🖊  Adding Bash path..."
    echo "############### setuptools ###############" >> $HOME/.bash_profile
    echo "export PATH=\$PATH:~/.setuptools/bin/" >> $HOME/.bash_profile
    echo "export SETUPTOOLS_BASH_INSTALLATION=OK" >> $HOME/.bash_profile
fi

if [ -e $HOME/.config/fish ]; then
    curl -O https://raw.githubusercontent.com/shotastage/setuptools.sh/master/tools/fish_utils.fish
    chmod +x fish_utils.fish
    ./fish_utils.fish
fi

echo "🧹  Cleaning..."
cd
rm -rf .setuptools_installation/
echo "🆗  Installation is completed!"
