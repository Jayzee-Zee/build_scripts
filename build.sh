#!/bin/bash

# Safety checks
#set -euo pipefail
#IFS=$'\n\t'

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

# Clone Proton Clang
#echo "Cloning Proton Clang..."
#rm -rf prebuilts/clang/host/linux-x86/proton-clang
#git clone --depth=1 https://github.com/kdrag0n/proton-clang.git \
 #   prebuilts/clang/host/linux-x86/proton-clang

# Set environment variables
export BUILD_USERNAME="Jayzee-Zee"
export BUILD_HOSTNAME="crave"
export TZ="Asia/Jakarta"

# Set custom clang paths (Proton Clang)
#export PATH="$(pwd)/prebuilts/clang/host/linux-x86/proton-clang/bin:$PATH"
#export CC="clang"
#export CXX="clang++"

# Force AOSP build system to use custom clang
#export CLANG_PATH="$(pwd)/prebuilts/clang/host/linux-x86/proton-clang"
#export USE_CUSTOM_CLANG=true
#export CUSTOM_CLANG=true
#export COMPILER_TYPE=proton
#export SDCLANG=false  # turn off SDCLANG if used

# Source build environment
source build/envsetup.sh

# Build ROM
echo "Starting build process..."
brunch earth
