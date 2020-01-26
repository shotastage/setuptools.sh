#!/usr/bin/env bash

STRATEGY_VERSION="v001"


install() {
    curl -O https://ymu.dl.osdn.jp/mytexpert/26068/jlisting.sty.bz2

    if [ -e jlisting.sty.bz2 ]; then
        bunzip2 jlisting.sty.bz2
        sudo mv jlisting.sty /usr/local/texlive/2019/texmf-dist/tex/latex/listings/
        sudo chmod +r /usr/local/texlive/2019/texmf-dist/tex/latex/listings/jlisting.sty
        sudo mktexlsr
    else
        echo "Failed to download jlisting."
    fi
}

uninstall() {
    sudo rm -f /usr/local/texlive/2019/texmf-dist/tex/latex/listings/jlisting.sty
}

update() {
    echo "Now under construction."
}
