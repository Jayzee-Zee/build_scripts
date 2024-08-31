rm -rf out/target/product/earth/*
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/AOSPA/manifest.git -b uvite --git-lfs --depth=1
#clone dev tree
git clone https://github.com/Jayzee-Zee/Local-Manifest --depth 1 -b AOSPA .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Jayzee-Zee 
export BUILD_HOSTNAME=crave
#export TARGET_PRODUCT=lineage_earth
#export TARGET_RELEASE=ap2a
export TZ=Asia/Jakarta
export KBUILD_USERNAME=Jayzee-Zee
export KBUILD_HOSTNAME=crave
source build/envsetup.sh
 
# beelding
./rom-build.sh earth
