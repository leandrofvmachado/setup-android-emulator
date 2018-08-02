#!/bin/bash

emulator -avd nx4-and5 -no-snapshot-save -accel on -noaudio -no-boot-anim &
emulator -avd px2-and6 -no-snapshot-save -accel on -noaudio -no-boot-anim &
emulator -avd s8-and7 -no-snapshot-save -accel on -noaudio -no-boot-anim &

#config first emulator
adb -s emulator-5554 wait-for-device

A=$(adb -s emulator-5554 shell getprop dev.bootcomplete | tr -d '\r')

while [ "$A" != "1" ]; do
    A=$(adb -s emulator-5554 shell getprop dev.bootcomplete | tr -d '\r')
    echo 'Waiting for first emulator to fully boot...'
    sleep 5
done

adb -s emulator-5554 shell settings put secure show_ime_with_hard_keyboard 0
adb -s emulator-5554 shell am broadcast -a com.android.intent.action.SET_LOCALE --es com.android.intent.extra.LOCALE ES
adb -s emulator-5554 shell settings put secure location_providers_allowed gps
echo 'complete setup first emulator'

#config second emulator
adb -s emulator-5556 wait-for-device

A=$(adb -s emulator-5556 shell getprop dev.bootcomplete | tr -d '\r')

while [ "$A" != "1" ]; do
    A=$(adb -s emulator-5556 shell getprop dev.bootcomplete | tr -d '\r')
    echo 'Waiting for second emulator to fully boot...'
    sleep 5
done

adb -s emulator-5556 shell settings put secure show_ime_with_hard_keyboard 0
adb -s emulator-5556 shell am broadcast -a com.android.intent.action.SET_LOCALE --es com.android.intent.extra.LOCALE ES
adb -s emulator-5556 shell settings put secure location_providers_allowed gps
echo 'complete setup second emulator'

#config third emulator
adb -s emulator-5558 wait-for-device

A=$(adb -s emulator-5558 shell getprop dev.bootcomplete | tr -d '\r')

while [ "$A" != "1" ]; do
    A=$(adb -s emulator-5558 shell getprop dev.bootcomplete | tr -d '\r')
    echo 'Waiting for third emulator to fully boot...'
    sleep 5
done

adb -s emulator-5558 shell settings put secure show_ime_with_hard_keyboard 0
adb -s emulator-5558 shell am broadcast -a com.android.intent.action.SET_LOCALE --es com.android.intent.extra.LOCALE ES
adb -s emulator-5558 shell settings put secure location_providers_allowed gps
echo 'complete setup third emulator'
