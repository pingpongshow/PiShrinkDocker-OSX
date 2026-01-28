#!/bin/bash
# Helper script to run PiShrink via Docker

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Ensure images directory exists
mkdir -p images

if [ $# -eq 0 ]; then
    echo "Usage: $0 [pishrink options] <image.img> [output.img]"
    echo ""
    echo "Options:"
    echo "  -s    Skip autoexpand"
    echo "  -v    Verbose output"
    echo "  -r    Advanced repair with e2fsck"
    echo "  -z    Compress with gzip"
    echo "  -Z    Compress with xz"
    echo "  -a    Compress with pigz (parallel gzip)"
    echo "  -d    Debug mode"
    echo ""
    echo "Example:"
    echo "  $0 -v -z myimage.img"
    echo "  $0 original.img shrunk.img"
    exit 1
fi

docker compose run --rm pishrink "$@"
