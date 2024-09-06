
rm -rf out/target/product/earth/*.zip
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/CipherOS/android_manifest.git -b fourteen-qpr --git-lfs --depth=1
#clone dev tree
git clone https://github.com/Jayzee-Zee/Local-Manifest --depth 1 -b CipherOS .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh &&
#repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
# Set up build environment
export BUILD_USERNAME=Jayzee-Zee
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=1
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
export KBUILD_USERNAME=Jayzee-Zee
export KBUILD_HOSTNAME=crave
source build/envsetup.sh

lunch cipher_earth-ap1a-userdebug
lunch cipher_earth-ap2a-userdebug

echo "Im crave sir I will start beelding now Just hope it doesn't fail lol"

m bacon

# sleep 10m

 

#curl https://raw.githubusercontent.com/Jayzee-Zee/build_scripts/CipherOS/build.sh | bash
