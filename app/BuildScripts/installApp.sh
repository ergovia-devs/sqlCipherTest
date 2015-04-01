#!/bin/bash

cordova create ../../crashApp de.ergovia.crashApp crashApp
cd ../../crashApp
cordova platform add android
cordova plugin add https://github.com/brodysoft/Cordova-sqlcipher-adaptor
#cordova plugin add https://github.com/ergovia-mobile/Cordova-SQLitePlugin.git#r2014.07Cipher

rm -rf www/*
cp -a ../app/src/* www/