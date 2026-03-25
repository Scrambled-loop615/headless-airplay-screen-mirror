# Halfbook Pro AirPlay Helper

This repo is for a "halfbook pro" setup where the Mac can boot and initiate AirPlay even when the built-in screen is unusable or not visible. 

You must enable the screen mirror icon to show in the menu bar.

Currently tested and working on Sequoia.

Video Link:<br>
[![How it Works Video](https://img.youtube.com/vi/9cStYCcJYCw/0.jpg)](https://www.youtube.com/shorts/9cStYCcJYCw)

The workflow is:

1. AeroSpace starts at login.
2. AeroSpace plays a startup chime so you know the session is up.
3. Press `opt-f1` to run the AirPlay picker script.
4. Use the script flow to discover and connect to an AirPlay display.

## Files

- `Airplay.sh`: main launcher for the AirPlay flow
- `ListAirplayDevices.sh`: discovers available AirPlay targets and stores a device map
- `ConnectAirplay.sh`: connects to the selected AirPlay target
- `.aerospace.toml`: minimal AeroSpace config that starts at login, plays the chime, and binds `opt-f1`

## AeroSpace config

Copy the repo config into place:

```sh
cp .aerospace.toml ~/.aerospace.toml
```

The config intentionally keeps only:

- `start-at-login = true`
- a startup chime using `afplay`
- `option-f1` bound to `Airplay.sh`

## Intended use

This is meant for cases where:

- the laptop panel is dead or unreadable
- you still need a reliable sign that login completed
- you want a single keyboard shortcut to start AirPlay without navigating the UI

If the repo moves, update the script path in `.aerospace.toml`.
