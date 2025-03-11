#!/bin/sh

cd "/home/shared/librewolf-bin" || { echo "failed to cd into /home/shared/librewolf-bin"; exit 1; }

if ! git pull; then
    echo "Error: Failed to pull from the librewolf git repo"
    exit 1
fi

if ! makepkg -si; then
    echo "Error: Failed to build and install the package"
    exit 1
fi

if ! sudo pacman -Syu; then
    echo "Error: Failed to update the system"
    exit 1
fi

orphans=$(pacman -Qdtq || true)
if [ -z "${orphans:-}" ]; then
    echo "No orphan packages found"
fi

if [ -n "${orphans:-}" ] && ! sudo pacman -Rns "$orphans"; then
    echo "Error: Failed to remove orphan packages"
    exit 1
fi

if ! sudo auto-cpufreq --update=/home/shared/auto-cpufreq; then
    echo "Error: Failed to update auto-cpufreq"
    exit 1
fi

if ! fwupdmgr update; then
    echo "Error: failed to update firmware"
    exit 1
fi

echo "Successfully updated system"
