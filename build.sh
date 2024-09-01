rm -rf out/target/product/earth/*
rm -rf device/xiaomi/earth
rm -rf vendor/xiaomi/earth
rm -rf device/mediatek/sepolicy_vndr
rm -rf kernel/xiaomi/earth
rm -rf hardware/xiaomi
rm -rf hardware/mediatek
rm -rf frameworks/base
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/AOSPA/manifest.git -b uvite --git-lfs --depth=1
#clone dev tree
git clone https://github.com/Jayzee-Zee/android_device_xiaomi_earth -b AOSPA device/xiaomi/earth 
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth -b lineage-21 vendor/xiaomi/earth
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr -b lineage-21 device/mediatek/sepolicy_vndr
git clone https://github.com/Jayzee-Zee/android_kernel_xiaomi_earth -b nonksu kernel/xiaomi/earth
git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-21 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek -b lineage-21 hardware/mediatek
git clone https://github.com/AOSPA/android_frameworks_base -b uvite frameworks/base
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
chmod +x vendor/lineage/config/*mk
chmod +x vendor/lineage/*
export BUILD_USERNAME=Jayzee-Zee 
export BUILD_HOSTNAME=crave
#export TARGET_PRODUCT=lineage_earth
#export TARGET_RELEASE=ap2a
export TZ=Asia/Jakarta
export KBUILD_USERNAME=Jayzee-Zee
export KBUILD_HOSTNAME=crave
source build/envsetup.sh

lunch aospa_earth-ap2a-userdebug
lunch aospa_earth-userdebug


m bacon
 
# beelding

