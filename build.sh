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
lunch lineage_earth-user 
#lunch lineage_earth-ap2a

#beelding
m bacon 
