#!/bin/bash
set -e
echo "🛰️ Fetching repositories..."
REPOS=$(gh repo list --limit 100 --json name --jq '.[].name')
for repo in $REPOS; do
    printf "❓ Delete 'Evowake/%s'? (y/n/q): " "$repo"
    read -r choice
    choice=$(echo "$choice" | xargs | tr '[:upper:]' '[:lower:]')
    [[ "$choice" == "y" ]] && gh repo delete "Evowake/$repo" --yes && echo "🔥 Deleted."
    [[ "$choice" == "q" ]] && exit 0
done
