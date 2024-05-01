#!/bin/bash

# Function to add a WiFi network
add_wifi_network() {
    local ssid="$1"

    # Check for 'cmd' command availability
    if type cmd &>/dev/null; then
        if cmd wifi connect-network "\"$ssid\"" open -r auto; then
            echo "Network $ssid added and enabled."
        else
            echo "Failed to add network $ssid using cmd."
        fi
    # Check for 'wpa_cli' command availability
    elif type wpa_cli &>/dev/null; then
        local network_id=$(wpa_cli add_network | awk 'END{print $NF}')
        if [[ -z "$network_id" ]]; then
            echo "Failed to add network: wpa_cli add_network failed."
            return
        fi

        wpa_cli set_network "$network_id" ssid "\"$ssid\"" &&
        wpa_cli set_network "$network_id" &&
        wpa_cli set_network "$network_id" mac_addr 1 &&
        wpa_cli enable_network "$network_id" &&
        wpa_cli save_config &&
        echo "Network $ssid added and enabled."
    else
        echo "No suitable command found to add network $ssid."
    fi
}

# Temporarily set SELinux to permissive mode
local old_se=$(getenforce)
setenforce 0

# Add networks
add_wifi_network "#Wifi@Jewel"
add_wifi_network "_DarlingSquareFreeWifi_"
add_wifi_network "_FREE Smart WiFi @NAIA3"
add_wifi_network "_WorldSquareFreeWifi_"
add_wifi_network "Auckland Airport"
add_wifi_network "ConvergeFreeWifi_NAIAT3_5G"
add_wifi_network "CP WIFI"
add_wifi_network "Free Skyline Internet"
add_wifi_network "Free Telstra Wi-Fi"
add_wifi_network "FreeWiFi@SYD"
add_wifi_network "Glowworm Caves Guest"
add_wifi_network "Grill'd Guest"
add_wifi_network "KFC Free Wifi"
add_wifi_network "Maccas Free Wi-fi"
add_wifi_network "Merlin_Guest"
add_wifi_network "OperaHouse_FreeWiFi"
add_wifi_network "QF-Guest"
add_wifi_network "Scenic World Free Wifi"
add_wifi_network "Shangri-La"
add_wifi_network "skynetglobal"
add_wifi_network "Sydney Tower - Guest"
add_wifi_network "Taronga Guest WiFi"
add_wifi_network "Telstra"
add_wifi_network "Apple Demo"
add_wifi_network "Apple Store"
add_wifi_network "Hungry Jack's FREE WiFi"

# Restore SELinux state
setenforce "$old_se"

exit