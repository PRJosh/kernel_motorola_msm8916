#!/bin/bash

# Stupid shell script to compile kernel, nothing fancy

# Exports all the needed things Arch, SubArch and Cross Compile
export ARCH=arm
echo 'exporting Arch'
export SUBARCH=arm
echo 'exporting SubArch'
# TODO make this more universal
export CROSS_COMPILE=/home/prbassplayer/lp5.1/prebuilt/linux-x86/toolchain/linaro-4.9-14.06/bin/arm-linux-gnueabihf-
#export CROSS_COMPILE=/home/prbassplayer/lp5.1/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-
echo 'exporting Cross Compile'

# Make sure build is clean!
echo 'Cleaning build'
make clean

# Generates a new .config and exits
if [ "$1" = "config" ] ; then
#    if [ "$2" = "perf" ] ; then
        echo 'Making defconfig for Surnia perf'
        make msm8916-perf_defconfig
        exit
#    else
#        echo 'Making defconfig for Slim Surnia'
#        make slim_surnia_defconfig
#        exit
#    fi
fi

# Lets go!
echo 'Lets start!'
make -j$1
