#!/bin/bash

set -euo pipefail

pkgs=$(cd ~/.local/share/nvim/mason/packages && ls | awk '{print ""$0""}')

echo "$pkgs" > ".mason_packages"
