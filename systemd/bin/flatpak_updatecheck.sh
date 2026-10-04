#!/usr/bin/env bash
sleep 10
if ! [[ "$(which notify-send)" =~ (notify-send) ]]; then
    echo "notify-send not found"
    exit 1
fi

flatpaks_updated=$(flatpak remote-ls --updates)
if ! [[ -z ${flatpaks_updated} ]]; then
    notify-send -u normal "Flatpak updates available" "$flatpaks_updated"
fi
