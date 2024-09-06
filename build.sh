cd ~/
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi
source ~/.profile
cd ~/
git clone https://github.com/akhilnarang/scripts
cd scripts
./setup/android_build_env.sh
cd ~/
sudo mkdir -p ~/bin
sudo mkdir -p ~/android
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
git config --global user.email "salitagwapo@gmail.com"
git config --global user.name "Jayzee"
pkg upgrade
sudo mkdir /android
cd /android
rm -rf out/target/product/earth/*.zip
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/CipherOS/android_manifest.git -b fourteen-qpr --git-lfs --depth=1
#clone dev tree
git clone https://github.com/Jayzee-Zee/Local-Manifest --depth 1 -b CipherOS .repo/local_manifests &&
# Sync the repositories
#/opt/crave/resync.sh 
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all) &&
# Set up build environment
export BUILD_USERNAME=Jayzee-Zee
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=1
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
export KBUILD_USERNAME=Jayzee-Zee
export KBUILD_HOSTNAME=crave
source build/envsetup.sh

breakfast earth userdebug

echo "Im crave sir I will start beelding now Just hope it doesn't fail lol"

m bacon
 

