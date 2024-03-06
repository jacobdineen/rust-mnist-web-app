#!/usr/bin/env bash

# Define the path to the Rust crate that will be compiled to WebAssembly.
CRATE_PATH="inference"

# Parse command line arguments
for arg in "$@"
do
    case $arg in
        --serve)
        SERVE=true
        shift # Remove --serve from processing
        ;;
        *)
        FEATURES="$arg" # Assume any other argument is a feature list
        ;;
    esac
done

# Add wasm32 target for the compiler.
rustup target add wasm32-unknown-unknown

# Check if wasm-pack is installed, if not, install it.
if ! command -v wasm-pack &> /dev/null; then
    echo "wasm-pack could not be found. Installing ..."
    cargo install wasm-pack
    exit
fi

# Set optimization flags
export RUSTFLAGS="-C lto=fat -C embed-bitcode=yes -C codegen-units=1 -C opt-level=3 --cfg web_sys_unstable_apis"

# Run wasm pack tool to build JS wrapper files and copy wasm to the specified pkg directory.
PKG_DIR="$CRATE_PATH/pkg"
mkdir -p $PKG_DIR
wasm-pack build $CRATE_PATH --out-dir $PKG_DIR --release --target web --no-typescript --no-default-features --features $FEATURES

# copy PKG_DIR="$CRATE_PATH/pkg/inference.js" to root directory
cp ./inference/$PKG_DIR/inference.js .
# copy inference_bg.wasm to root directory
cp ./inference/$PKG_DIR/inference_bg.wasm .
