rm -rf out/target/product/earth/*
rm -rf hardware/xiaomi
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init  -u https://github.com/ProjectBlaze/manifest -b 14 --depth=1
#clone dev tree
#git clone https://github.com/Jayzee-Zee/Local-Manifest --depth 1 -b Alpha .repo/local_manifests &&
# Sync the 
#repositories
git clone https://github.com/Jayzee-Zee/android_device_xiaomi_earth -b Blaze device/xiaomi/earth 
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth -b lineage-21 vendor/xiaomi/earth
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr -b lineage-21 device/mediatek/sepolicy_vndr
git clone https://github.com/Jayzee-Zee/android_kernel_xiaomi_earth -b nonksu kernel/xiaomi/earth
git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-21 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek -b lineage-21 hardware/mediatek &&
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Jayzee-Zee 
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
#export TARGET_PRODUCT=lineage_earth
#export TARGET_RELEASE=ap2a
export TZ=Asia/Jakarta
source build/envsetup.sh
 
# Build the ROM
lunch blaze_earth-ap2a-userdebug

#beelding

make bacon
