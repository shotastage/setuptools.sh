#!/usr/bin/env bash



CONTENT=$(cat << EOS
{
    "latex-workshop.latex.tools": [
        {
          "command": "ptex2pdf",
          "args": ["-l", "-ot", "-kanji=utf8 -synctex=1", "%DOC%"],
          "name": "Step 1: ptex2pdf"
        },
        {
          "command": "pbibtex",
          "args": ["%DOCFILE%", "-kanji=utf8"],
          "name": "Step 2: pbibtex"
        },
        {
          "command": "ptex2pdf",
          "args": ["-l", "-ot", "-kanji=utf8 -synctex=1", "%DOC%"],
          "name": "Step 3: ptex2pdf"
        },
        {
          "command": "ptex2pdf",
          "args": ["-l", "-ot", "-kanji=utf8 -synctex=1", "%DOC%"],
          "name": "Step 4: ptex2pdf"
        }
      ],
      "latex-workshop.latex.recipes": [
        {
          "name": "toolchain",
          "tools": [
            "Step 1: ptex2pdf",
            "Step 2: pbibtex",
            "Step 3: ptex2pdf",
            "Step 4: ptex2pdf"
          ]
        }
      ],
      "latex-workshop.view.pdf.viewer": "tab",
      "latex-workshop.chktex.enabled": false
}
EOS
)



uptask() {
    if [ -e ./.vscode/settings.json ]; then
        mv ./.vscode/settings.json ./.vscode/settings-backup.json
    else
        mkdir .vscode/
    fi

    echo $CONTENT >> ./.vscode/settings.json
}

