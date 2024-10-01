#rm -rf out/target/product/earth/*
#rm -rf hardware/xiaomi
#rm -rf hardware/mediatek
#rm -rf frameworks/base
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/The-Pixel-Project/manifest.git -b fourteen-qpr3 --git-lfs --depth=1
#clone dev tree
#git clone https://github.com/Jayzee-Zee/android_device_xiaomi_earth -b Pixel device/xiaomi/earth 
#git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth -b lineage-21 vendor/xiaomi/earth
#git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr -b lineage-21 device/mediatek/sepolicy_vndr
#git clone https://github.com/Jayzee-Zee/android_kernel_xiaomi_earth -b nonksu kernel/xiaomi/earth
#git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-21 hardware/xiaomi
#git clone https://github.com/LineageOS/android_hardware_mediatek -b lineage-21 hardware/mediatek &&
#git clone https://github.com/The-Pixel-Project/frameworks_base -b fourteen-qpr3 frameworks/base
git clone https://github.com/Jayzee-Zee/Local-Manifest --depth 1 -b Pixel .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Jayzee-Zee 
export BUILD_HOSTNAME=crave
#export TARGET_PRODUCT=lineage_earth
#export TARGET_BUILD_VARIANT=userdebug
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=1
#export TARGET_RELEASE=ap2a
export TZ=Asia/Jakarta
#export RISING_MAINTAINER=Jayzee
source build/envsetup.sh || sudo bash build/envsetup.sh
 
# Build the ROM
chmod 777 vendor/aosp/config/common_full_phone.mk
chmod 777 vendor/aosp/config/*.mk
lunch aosp_earth-userdebug || lunch aosp_earth-ap2a-userdebug || breakfast earth userdebug

#beelding
make bacon -j$(nproc --all)
