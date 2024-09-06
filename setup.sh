sudo passwd root && 1
1
su && 1
1
cd $HOME
mkdir $HOME/build
cd $HOME/build
sudo apt-get update
sudo apt-get install repo git
sudo apt-get install openjdk-8-jdk
sudo apt-get install openjdk-8-jre
sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip schedtool
sudo apt-get upgrade
cd $HOME/build
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
# add Android SDK platform tools to path
if [ -d "$HOME/build/platform-tools" ] ; then
    PATH="$HOME/build/platform-tools:$PATH"
fi
source /.profile
cd $HOME/build
git clone https://github.com/akhilnarang/scripts 
cd $HOME/build/scripts
./setup/android_build_env.sh
cd $HOME/build
curl https://storage.googleapis.com/git-repo-downloads/repo > $HOME/build/bin/repo
chmod a+x $HOME/build/bin/repo
git config --global user.email "salitagwapo@gmail.com"
git config --global user.name "Jayzee"
cd $HOME/build
