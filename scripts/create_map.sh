#!/bin/bash

mkdir -p maps
cd runtime
dotnet Extract.dll --recordings=Recordings/ -o=../maps/ --map $1
cd ..
