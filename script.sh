rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/Evolution-X/manifest -b u
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests_clo -b udc-2-evo .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch evolution_mi439-userdebug
make installclean
m evolution
