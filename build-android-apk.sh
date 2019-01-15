#!/bin/bash

MYPATH="/Users/your-user/"
cd $MYPATH/project-path
git reset --hard
git checkout dev
git pull
chmod +x gradlew
./gradlew assemble
rm $MYPATH/target-path/apk.apk
mv $MYPATH/project-path/app/build/outputs/apk/debug/app-debug.apk $MYPATH/target-path/apk.apk
