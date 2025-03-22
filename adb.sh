#!/bin/bash

# Array of packages to uninstall
packages=(
    "com.facemoji.lite.xiaomi"
    "com.android.bookmarkprovider"
    "com.android.wallpaper.livepicker"
    "com.google.android.feedback"
    "com.google.android.gms.location.history"
    "com.google.android.googlequicksearchbox"
    "com.google.android.marvin.talkback"
    "com.google.android.syncadapters.calendar"
    "com.google.android.tts"
    "com.google.ar.lens"
    "com.mipay.wallet.id"
    "com.mipay.wallet.in"
    "com.miui.analytics"
    "com.miui.android.fashiongallery"
    "com.miui.aod"
    "com.miui.bugreport"
    "com.miui.hybrid"
    "com.miui.hybrid.accessory"
    "com.miui.micloudsync"
    "com.miui.msa.global"
    "com.miui.phrase"
    "com.miui.translation.kingsoft"
    "com.miui.videoplayer"
    "com.xiaomi.payment"
    "com.xiaomi.glgm"
    "com.xiaomi.micloud.sdk"
    "com.xiaomi.miplay_client"
    "com.xiaomi.mipicks"
    "com.xiaomi.midrop"
    "com.xiaomi.joyose"
    "com.android.chrome"
    "com.android.browser"
    "com.mi.globalbrowser"
    "com.miui.player"
    "com.google.android.projection.gearhead"
    "com.mi.android.globalminusscreen"
)

# Ask the user whether to use --user 0 or not
echo "Do you want to uninstall with '--user x'? (y/n)"
read -r use_user
echo ""


if [[ "$use_user" == "y" || "$use_user" == "Y" ]]; then
    echo "Do you want to uninstall for '--user 0' or '--user 0'? (0/10)"
    read -r usernum
    # Loop through the array and uninstall each package with --user 0
    for package in "${packages[@]}"; do
        result=$(adb shell pm uninstall --user $usernum "$package")
        if [[ "$result" == *"Success"* ]]; then
            echo "Successfully uninstalled $package with --user $usernum"
        fi
    done
else
    # Loop through the array and uninstall each package without --user 0
    for package in "${packages[@]}"; do
        result=$(adb shell pm uninstall "$package")
        if [[ "$result" == *"Success"* ]]; then
            echo "Successfully uninstalled $package without --user x"
        fi
    done
fi
