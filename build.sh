rm -rf out/target/product/earth/*
rm -rf hardware/xiaomi
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/AlphaDroid-Project/manifest.git -b alpha-14 --git-lfs --depth=1
#clone dev tree
git clone https://github.com/Jayzee-Zee/Local-Manifest --depth 1 -b Alpha .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Jayzee-Zee 
export BUILD_HOSTNAME=crave
#export TARGET_PRODUCT=lineage_earth
#export TARGET_RELEASE=ap2a
export TZ=Asia/Jakarta
source build/envsetup.sh
 
# Build the ROM
lunch lineage_earth-ap2a-userdebug

#beelding

make bacon
