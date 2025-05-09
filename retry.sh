#!/bin/bash

set -e
export BUILD_USERNAME=Jayzee-Zee 
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export TARGET_RELEASE=ap2a
export TZ=Asia/Jakarta
# Boot animation performance tweak
export TARGET_BOOT_ANIMATION_RES := 720
export TARGET_BOOT_ANIMATION_PRELOAD := false

source build/envsetup.sh

# Try all lunch targets
for target in blaze_earth-ap2a-userdebug blaze_earth-userdebug lineage_earth-ap2a-userdebug lineage_earth-userdebug; do
    if lunch "$target"; then
        echo "[+] Using $target"
        break
    fi
done

# Start building using all CPU cores
if make -j$(nproc --all) bacon; then
    echo "[✓] Build succeeded, exiting cleanly."
    exit 0
else
    echo "[✗] Build failed. Waiting 10 minutes before trying remote script..."
    sleep 600
    echo "[→] Fetching and running updated remote build script..."

    curl -fsSL "https://raw.githubusercontent.com/Jayzee-Zee/build_scripts/refs/heads/Blaze/retry.sh" | bash
fi
