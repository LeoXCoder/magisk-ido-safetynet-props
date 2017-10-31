#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

# Unified daemon > v12 moves resetprop to a function of /data/magisk/magisk
resetprop=/data/magisk/resetprop
if [ ! -f $resetprop ]; then
    resetprop="/data/magisk/magisk resetprop"
fi

#$resetprop ro.boot.verifiedbootstate green
#$resetprop ro.boot.veritymode enforcing

# https://forum.xda-developers.com/showpost.php?p=70831797&postcount=3665
$resetprop ro.build.description "ido-user 5.1.1 LMY47V V8.1.3.0.LAIMIDI release-keys"
$resetprop ro.build.fingerprint "Xiaomi/ido/ido:5.1.1/LMY47V/V8.1.3.0.LAIMIDI:user/release-keys"

$resetprop ro.bootimage.build.fingerprint "Xiaomi/ido/ido:5.1.1/LMY47V/V8.1.3.0.LAIMIDI:user/release-keys"

#$resetprop selinux.reload_policy 1

# https://www.reddit.com/r/pokemongodev/comments/58gnq3/root_bypass_the_new_update_leads_repost/
# $resetprop ro.build.selinux 0

## https://forum.xda-developers.com/showpost.php?p=71154562&postcount=4
#$resetprop ro.debuggable 0
#$resetprop ro.secure 1
#$resetprop ro.build.type user
#$resetprop ro.build.tags release-keys

# https://github.com/topjohnwu/MagiskManager/issues/112#issuecomment-280993699
if [ -d "/magisk/.core/magiskhide" ]; then
  sh /magisk/.core/magiskhide/enable
else
  /data/magisk/magisk magiskhide --enable
fi
