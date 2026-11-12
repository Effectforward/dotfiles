#!/usr/bin/env bash
set -euo pipefail

# Flameshot requires a literal absolute savePath; it does not expand ~ or $HOME.
# So keep the tracked config as a template and generate the real config per machine.
script_path="$(readlink -f "${BASH_SOURCE[0]}")"
repo_root="$(dirname "$(dirname "$script_path")")"
template="$repo_root/templates/flameshot.ini"

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/flameshot"
config_file="$config_dir/flameshot.ini"

force=false
if [[ "${1:-}" == "--force" ]]; then
    force=true
fi

if [[ ! -f "$template" ]]; then
    echo "Template not found: $template" >&2
    exit 1
fi

# If Stow folded the whole config directory into a symlink, replace it with a
# real directory so the generated config is local to this machine.
if [[ -L "$config_dir" ]]; then
    rm -f "$config_dir"
fi

mkdir -p "$config_dir"

if [[ -L "$config_file" ]]; then
    # Replace the old stow symlink with a real per-machine config.
    rm -f "$config_file"
elif [[ -e "$config_file" ]]; then
    if [[ "$force" != true ]]; then
        echo "Refusing to overwrite existing $config_file" >&2
        echo "Run with --force to back it up and replace it." >&2
        exit 0
    fi
    cp "$config_file" "$config_file.bak"
fi

while IFS= read -r line || [[ -n "$line" ]]; do
    printf '%s\n' "${line//@HOME@/$HOME}"
done < "$template" > "$config_file"

echo "Wrote $config_file"
