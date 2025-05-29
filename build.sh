#!/bin/bash

# Safety checks
set -euo pipefail
IFS=$'\n\t'

# Clean previous build
echo "Cleaning previous build..."
rm -rf out/target/product/earth/*

# Initialize repository
echo "Initializing repository..."
repo init -u https://github.com/ProjectMatrixx/android.git \
    -b 15.0 \
    --git-lfs \
    --depth=1

# Setup local manifest
echo "Setting up local manifest..."
rm -rf .repo/local_manifests/
git clone https://github.com/Jayzee-Zee/Local-Manifest.git \
    --depth 1 \
    -b matrixx \
    .repo/local_manifests/

# Sync repositories
echo "Syncing repositories..."
/opt/crave/resync.sh

# Set environment variables
export BUILD_USERNAME="Jayzee-Zee"
export BUILD_HOSTNAME="crave"
export TZ="Asia/Jakarta"

# Source build environment
source build/envsetup.sh

# Build ROM
echo "Starting build process..."
brunch earth
