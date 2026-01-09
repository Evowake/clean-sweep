#!/bin/bash
set -e
REPOS=$(gh repo list --limit 100 --json name --jq '.[].name')
for repo in $REPOS; do
    printf "❓ Delete '%s'? (y/n/q): " "$repo"
    read -r choice
    choice=$(echo "$choice" | xargs | tr '[:upper:]' '[:lower:]')
    [[ "$choice" == "y" ]] && gh repo delete "Evowake/$repo" --yes && echo "🔥 Stripped."
    [[ "$choice" == "q" ]] && exit 0
done
