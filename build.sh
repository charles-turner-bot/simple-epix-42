#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
: "${CIQ_SDK:?Set CIQ_SDK to the extracted Connect IQ SDK directory}"
: "${CIQ_KEY:?Set CIQ_KEY to your developer signing key (DER format)}"
mkdir -p dist
"$CIQ_SDK/bin/monkeyc" -f monkey.jungle -d epix2pro42mm -o dist/SimpleForJas.prg -y "$CIQ_KEY" -w
