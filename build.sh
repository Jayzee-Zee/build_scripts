
rm -rf out/target/product/earth/*.zip
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/CipherOS/android_manifest.git -b fourteen-qpr --git-lfs --depth=1
#clone dev tree
git clone https://github.com/Jayzee-Zee/Local-Manifest --depth 1 -b CipherOS .repo/local_manifests
# Sync the repositories
/opt/crave/resync.sh &&
# Set up build environment
source build/envsetup.sh
export BUILD_USERNAME=Jayzee-Zee
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=1
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
export KBUILD_USERNAME=Jayzee-Zee
export KBUILD_HOSTNAME=crave
sudo chmod +x vendor/cipher/config/common_full_phone.mk
sudo chmod 777 vendor/cipher/config/common_full_phone.mk
lunch cipher_earth-userdebug || lunch cipher_earth-ap1a-userdebug || lunch cipher_earth-ap2a-userdebug || breakfast earth userdebug || brunch earth userdebug

echo "Im crave sir I will start beelding now Just hope it doesn't fail lol"

make bacon

# sleep 10m

 

#curl https://raw.githubusercontent.com/Jayzee-Zee/build_scripts/CipherOS/build.sh | bash
