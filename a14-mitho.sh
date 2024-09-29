rm -rf .repo/local_manifests/
#repo init rom
repo init -u romsource -b branch --git-lfs
#Local manifests
git clone yourmanifest -b branch .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_earth-userdebug #edit this according to your rom build commands
make bacon #also edit this if needed
