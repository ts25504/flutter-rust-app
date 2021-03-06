#!/bin/bash

rustup target add aarch64-linux-android armv7-linux-androideabi i686-linux-android

cargo build --target aarch64-linux-android --release
cargo build --target armv7-linux-androideabi --release
cargo build --target i686-linux-android --release

JNILIBS_DIR=$(cd ../android/app/src/main; pwd)/jniLibs
rm -rf $JNILIBS_DIR
mkdir $JNILIBS_DIR
mkdir $JNILIBS_DIR/arm64-v8a
mkdir $JNILIBS_DIR/armeabi-v7a
mkdir $JNILIBS_DIR/x86

ln -snf $PWD/target/aarch64-linux-android/release/libmiddleware.so ${JNILIBS_DIR}/arm64-v8a/libmiddleware.so
ln -snf $PWD/target/armv7-linux-androideabi/release/libmiddleware.so ${JNILIBS_DIR}/armeabi-v7a/libmiddleware.so
ln -snf $PWD/target/i686-linux-android/release/libmiddleware.so ${JNILIBS_DIR}/x86/libmiddleware.so
