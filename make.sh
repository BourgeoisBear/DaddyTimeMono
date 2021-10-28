#!/bin/sh

ROOT_NAME="DaddyTimeMono"
DIR_OUT="./build"

rm -f ${DIR_OUT}/*
fontforge -lang=ff -script ./make.ffscript ./${ROOT_NAME}.sfd
#ttfautohint -v -n -i -W ${DIR_OUT}/${ROOT_NAME}.nohint.ttf ${DIR_OUT}/${ROOT_NAME}.ttf

