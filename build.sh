rm -rf out/target/product/earth/*.zip
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/CipherOS/android_manifest.git -b fourteen-qpr --git-lfs --depth=1
#clone dev tree
git clone https://github.com/Jayzee-Zee/Local-Manifest --depth 1 -b CipherOS .repo/local_manifests &&
# Sync the repositories
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)  && 
# Set up build environment
chmod +x vendor/lineage/config/*.mk
chmod +x vendor/lineage/*
export BUILD_USERNAME=Jayzee-Zee
export TARGET_PRODUCT=cipher_earth
export TARGET_BUILD_VARIANT=userdebug
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=1
export BUILD_HOSTNAME=crave
#export TARGET_PRODUCT=lineage_earth
#export TARGET_RELEASE=ap2a
export TZ=Asia/Jakarta
export KBUILD_USERNAME=Jayzee
export KBUILD_HOSTNAME=crave
source build/envsetup.sh

lunch cipher_earth-ap1a-userdebug
lunch cipher_earth-userdebug


m bacon
 
# beelding

