#!/bin/bash

version=3.9

py1=$(whereis python | grep $version)

myid=$(id -u)

sudoprefix=
if (( $EUID != 0 )); then
    sudoprefix="sudo"
else
    sudoprefix=""
fi

if [ -z "$py1" ]
then
    echo "\$py1 is empty"
    $sudoprefix apt update -y
    $sudoprefix apt install software-properties-common -y
    $sudoprefix echo -ne '\n' | add-apt-repository ppa:deadsnakes/ppa
    $sudoprefix apt install python3.9 -y
fi

py1=$(whereis python | grep 3.9)

if [ -z "$py1" ]
then
    echo ""
else
    echo "Python v$version has been installed."
fi
