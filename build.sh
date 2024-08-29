rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/xdroid-oss/xd_manifest.git -b fourteen --git-lfs --depth=1
#clone dev tree
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
