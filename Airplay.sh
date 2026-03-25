#!/bin/bash

# Discover devices, speak the list, press a number key (no Enter) to connect.

script_dir=$(cd "$(dirname "$0")" && pwd)
DEVICE_FILE="$HOME/.airplay_devices"
connect_script="$script_dir/ConnectAirplay.sh"

"$script_dir/ListAirplayDevices.sh" --list-only >/dev/null || exit $?

names=()
while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" ]] && continue
    names+=("${line#*|}")
done < "$DEVICE_FILE"

if [[ ${#names[@]} -eq 0 ]]; then
    echo "No devices in list."
    exit 1
fi

list_output=''
for i in "${!names[@]}"; do
    list_output+=$(printf '  %d) %s\n' "$((i + 1))" "${names[i]}")
done
list_output+=$'\n'

(
    last=$((${#names[@]} - 1))
    for i in "${!names[@]}"; do
        say "$((i + 1)), ${names[i]}."
        (( i < last )) && sleep 0.05
    done
) &
say_job=$!

stop_speaking() {
    [[ -n "${say_job:-}" ]] || return
    kill -TERM "$say_job" 2>/dev/null
    pkill -P "$say_job" 2>/dev/null
    wait "$say_job" 2>/dev/null
}

selection_prompt="Choose device (1-${#names[@]}), press a number: "

pick_and_connect() {
    printf '%s' "$list_output"
    read -rsn1 -p "$selection_prompt" choice </dev/tty || { stop_speaking; exit 1; }
    echo
    stop_speaking
    if [[ ! "$choice" =~ ^[1-9]$ ]] || (( choice > ${#names[@]} )); then
        echo "Invalid choice: $choice"
        exit 1
    fi
    exec "$connect_script" "$choice"
}

if [[ -t 0 ]]; then
    pick_and_connect
else
    printf -v inner_cmd 'clear; printf %%s %q; read -rsn1 -p %q choice </dev/tty || exit 1; printf "\\n"; if [[ "$choice" =~ ^[1-9]$ ]] && (( choice <= %d )); then exec %q "$choice"; fi; echo "Invalid choice: $choice"; sleep 3; exit 1' \
        "$list_output" \
        "$selection_prompt" \
        "${#names[@]}" \
        "$connect_script"
    printf -v terminal_cmd 'bash -lc %q' "$inner_cmd"
    osascript - "$terminal_cmd" <<'APPLESCRIPT' 2>/dev/null
on run argv
    tell application "Terminal"
        activate
        do script (item 1 of argv)
    end tell
end run
APPLESCRIPT
    exit 0
fi
