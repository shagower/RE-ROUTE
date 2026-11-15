#!/bin/sh
printf '\033c\033]0;%s\a' RE-ROUTE
base_path="$(dirname "$(realpath "$0")")"
"$base_path/RE-ROUTE.x86_64" "$@"
