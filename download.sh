#!/bin/bash

mkdir -p downloads
cd downloads

curl -L -C - -o "MSEdge.Win10.Vagrant.zip" "https://az792536.vo.msecnd.net/vms/VMBuild_20190311/Vagrant/MSEdge/MSEdge.Win10.Vagrant.zip"
curl -L -C - -o "nvda.exe" "https://www.nvaccess.org/files/nvda/releases/2020.3/nvda_2020.3.exe"
curl -L -C - -o "chrome_installer.exe" "http://dl.google.com/chrome/install/375.126/chrome_installer.exe"

if ! [ -f "MSEdge - Win10.box" ] && [ -f ".MSEdge.Win10.Vagrant.zip" ]; then
    unzip "MSEdge.Win10.Vagrant.zip"
fi