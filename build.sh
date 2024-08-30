rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/xdroid-oss/xd_manifest.git -b fourteen --git-lfs --depth=1
#clone dev tree
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git device/mediatek/sepolicy_vndr
git clone https://github.com/Jayzee-Zee/Local-Manifest --depth 1 -b Xdroid .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Jayzee-Zee 
export BUILD_HOSTNAME=crave
#export TARGET_PRODUCT=lineage_earth
#export TARGET_RELEASE=ap2a
export TZ=Asia/Jakarta
#export XDROID_MAINTAINER=Jayzee-Zee 
source build/envsetup.sh
 
# Build the ROM
#brunch xdroid_earth userdebug
lunch xdroid_earth-userdebug && make xd -j$(nproc --all)

rm -rf out/target/product/earth/*
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/The-Pixel-Project/manifest.git -b fourteen-qpr3 --git-lfs --depth=1
#clone dev tree
git clone https://github.com/Jayzee-Zee/Local-Manifest --depth 1 -b PixelProject .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Jayzee-Zee 
export BUILD_HOSTNAME=crave
#export TARGET_PRODUCT=lineage_earth
#export TARGET_RELEASE=ap2a
export TZ=Asia/Jakarta
#export RISING_MAINTAINER=Jayzee
source build/envsetup.sh
 
# Build the ROM
lunch aosp_earth-userdebug
#lunch lineage_earth-ap2a

#beelding
make bacon -j$(nproc --all)
