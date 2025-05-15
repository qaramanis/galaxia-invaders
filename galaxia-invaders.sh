#!/bin/sh
echo -ne '\033c\033]0;galaxia-invaders\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/galaxia-invaders.x86_64" "$@"
