#!/bin/bash

set -e
export BUILD_USERNAME=Jayzee-Zee
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
export RISING_MAINTAINER=Jayzee-Zee
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

echo "[*] Initializing repo..."
repo init -u https://github.com/ProjectBlaze/manifest.git -b 14 --depth=1

echo "[*] Cloning local manifest..."
git clone --depth=1 -b Blaze https://github.com/Jayzee-Zee/Local-Manifest .repo/local_manifests

echo "[*] Syncing sources..."
/opt/crave/resync.sh

echo "[*] Setting up environment..."
source build/envsetup.sh

# Try lunch targets one by one
echo "[*] Selecting lunch target..."
for target in blaze_earth-ap2a-userdebug blaze_earth-userdebug lineage_earth-ap2a-userdebug lineage_earth-userdebug; do
    if lunch "$target"; then
        echo "[+] Using $target"
        break
    fi
done

# Start the build
echo "[*] Starting build..."
if ! make bacon -j$(nproc); then
    echo "[!] Build failed. Waiting 10 minutes before checking for remote patch script..."
    sleep 600  # 10 minutes

    REMOTE_SCRIPT_URL="https://raw.githubusercontent.com/Jayzee-Zee/build_scripts/refs/heads/Blaze/retry.sh"

    while true; do
        echo "[*] Checking for remote script..."
        curl -fsSL "$REMOTE_SCRIPT_URL" -o /tmp/remote_patch.sh || true
        if [ -s /tmp/remote_patch.sh ]; then
            echo "[*] Executing remote patch script..."
            chmod +x /tmp/remote_patch.sh
            bash /tmp/remote_patch.sh || echo "[!] Remote patch script failed"
        else
            echo "[*] No patch script found, retrying in 30s..."
        fi
        sleep 30
    done
else
    echo "[+] Build completed successfully."
fi
