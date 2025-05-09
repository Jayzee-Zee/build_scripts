#!/usr/bin/env bash

# CONFIGURATION
DEVICE=earth
ROM=blaze
RELEASE=ap2a
MANIFEST_URL="https://github.com/ProjectBlaze/manifest"
MANIFEST_BRANCH="14"
LOCAL_MANIFEST_URL="https://github.com/Jayzee-Zee/Local-Manifest"
LOCAL_MANIFEST_BRANCH="Blaze"

LUNCH_TARGETS=(
  blaze_${DEVICE}-${RELEASE}-userdebug
  blaze_${DEVICE}-userdebug
  lineage_${DEVICE}-${RELEASE}-userdebug
  lineage_${DEVICE}-userdebug
)

export BUILD_USERNAME="Jayzee-Zee"
export BUILD_HOSTNAME="crave"
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export TZ="Asia/Jakarta"
JOBS=$(nproc)

# CLEAN
rm -rf out/target/product/$DEVICE/*
rm -rf hardware/xiaomi
rm -rf .repo/local_manifests

# INIT & LOCAL_MANIFEST
repo init -u "$MANIFEST_URL" -b "$MANIFEST_BRANCH" --depth=1
git clone --depth 1 -b "$LOCAL_MANIFEST_BRANCH" "$LOCAL_MANIFEST_URL" .repo/local_manifests

# RESYNC (Crave's fast method)
bash /opt/crave/resync.sh

# ENVIRONMENT SETUP
source build/envsetup.sh

# TRY LUNCH TARGETS
success=0
for target in "${LUNCH_TARGETS[@]}"; do
    echo "[*] Trying lunch target: $target"
    lunch "$target" && success=1 && break
    echo "[!] Failed: $target. Trying next..."
done

if [ "$success" -ne 1 ]; then
    echo "[x] ERROR: All lunch targets failed!"
    exit 1
fi

# START BUILD
make bacon -j"$JOBS"
