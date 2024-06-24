#!/bin/bash

echo "Package bootable image file. (EXT4 FS)"

rm -rf tmp/
mkdir -p tmp/

cp -r ./boot/* ./tmp/
cp ./arch/arm64/boot/Image ./tmp/
cp ./arch/arm64/boot/dts/rockchip/$KERNEL_TARGET.dtb ./tmp/
#cp ./arch/arm64/boot/dts/rockchip/$KERNEL_TARGET.dtb ./tmp/$RK_KERNEL_DTB
#cp ./resource.img ./tmp/
#cp ./System.map ./tmp/
#cp ./logo.bmp ./tmp/
cp ./logo_kernel.bmp ./tmp/

rm -rf boot.img && truncate -s 64M boot.img
fakeroot mkfs.ext4 -F -L "boot" -d ./tmp/ boot.img

rm -rf tmp/
