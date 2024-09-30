
rm -rf out/target/product/earth/*.zip
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/CipherOS/android_manifest.git -b fourteen-qpr --git-lfs --depth=1
#clone dev tree
#git clone https://github.com/Jayzee-Zee/Local-Manifest --depth 1 -b CipherOS .repo/local_manifests
git clone https://github.com/Jayzee-Zee/android_device_xiaomi_earth -b CipherOS device/xiaomi/earth 
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth -b lineage-21 vendor/xiaomi/earth
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr -b lineage-21 device/mediatek/sepolicy_vndr
git clone https://github.com/Jayzee-Zee/android_kernel_xiaomi_earth -b nonksu kernel/xiaomi/earth
git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-21 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek -b lineage-21 hardware/mediatek
# Sync the repositories
/opt/crave/resync.sh &&
# Set up build environment
export BUILD_USERNAME=Jayzee-Zee
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=1
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
export KBUILD_USERNAME=Jayzee-Zee
export KBUILD_HOSTNAME=crave
source build/envsetup.sh || sudo bash build/envsetup.sh
sudo chmod +x vendor/cipher/config/common_full_phone.mk
sudo chmod 777 vendor/cipher/config/common_full_phone.mk
lunch cipher_earth-userdebug || lunch cipher_earth-ap1a-userdebug || lunch cipher_earth-ap2a-userdebug || breakfast earth userdebug || brunch earth userdebug

echo "Im crave sir I will start beelding now Just hope it doesn't fail lol"

make bacon

# sleep 10m

 

#curl https://raw.githubusercontent.com/Jayzee-Zee/build_scripts/CipherOS/build.sh | bash
