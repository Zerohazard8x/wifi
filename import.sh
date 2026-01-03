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
add_wifi_network "WiFi_Chefexpress"
add_wifi_network "WiFi Frecciarossa"
add_wifi_network "WiFi Frecciargento"
add_wifi_network "WendysWifi"
add_wifi_network "Wawa WiFi"
add_wifi_network "Walmartwifi"
add_wifi_network "Telstra"
add_wifi_network "Taronga Guest WiFi"
add_wifi_network "Sydney Tower - Guest"
add_wifi_network "SWP_Lounges_Wifi"
add_wifi_network "Starhotels"
add_wifi_network "Starbucks WiFi"
add_wifi_network "SolenadFreeWIFI4ALL"
add_wifi_network "Smashburger Guest"
add_wifi_network "skynetglobal"
add_wifi_network "Shangri-La"
add_wifi_network "Scenic World Free Wifi"
add_wifi_network "Rydges World Square"
add_wifi_network "RhB-FREE"
add_wifi_network "QF-Guest"
add_wifi_network "Portaleregionale"
add_wifi_network "PAL_Wi-Fi"
add_wifi_network "OperaHouse_FreeWiFi"
add_wifi_network "OnAir"
add_wifi_network "Olive Garden Guest"
add_wifi_network "My Autogrill WI-FI"
add_wifi_network "merz-gast"
add_wifi_network "Merlin_Guest"
add_wifi_network "McDonald's Free WiFi"
add_wifi_network "Max's WiFi"
add_wifi_network "Maccas Free Wi-fi"
add_wifi_network "KFC Free Wifi"
add_wifi_network "InfoTrainment"
add_wifi_network "IBIS"
add_wifi_network "Hungry Jack's FREE WiFi"
add_wifi_network "hideaway "
add_wifi_network "H&M Free WiFi"
add_wifi_network "Grill'd Guest"
add_wifi_network "Glowworm Caves Guest"
add_wifi_network "FreeWiFi@SYD"
add_wifi_network "FreeWiFi-NARITA(2.4G)"
add_wifi_network "FreeWiFi-NARITA"
add_wifi_network "FreeWiFi-NARITA-main(5G)"
add_wifi_network "FreeMSGWIFI"
add_wifi_network "Free_WiFi_GVA"
add_wifi_network "Free WiFi"
add_wifi_network "Free Telstra Wi-Fi"
add_wifi_network "Free Skyline Internet"
add_wifi_network "Fountains"
add_wifi_network "EmiliaRomagnaWiFi wifiprivacy.it"
add_wifi_network "Edelweiss"
add_wifi_network "DIHDXB"
add_wifi_network "digitalelpaso"
add_wifi_network "CP WIFI"
add_wifi_network "ConvergeFreeWifi_NAIAT3_5G"
add_wifi_network "Comune di Tirano WiFi Free"
add_wifi_network "ClientScape"
add_wifi_network "CircuitLaneFreeWIFI4ALL"
add_wifi_network "CBP_GUEST"
add_wifi_network "BoldynWiFi"
add_wifi_network "Boingo Hotspot"
add_wifi_network "Auckland Airport"
add_wifi_network "Atrium"
add_wifi_network "Apple Store"
add_wifi_network "Apple Demo"
add_wifi_network "Animo Student"
add_wifi_network "Animo Connect"
add_wifi_network "ACCOR"
add_wifi_network "#Wifi@Jewel"
add_wifi_network "#WiFi@Changi"
add_wifi_network "#Guest WiFi"
add_wifi_network "#GigaSmartWiFi"
add_wifi_network "#DXB Free WiFi"
add_wifi_network "@WiFi UAE from du"
add_wifi_network "@SOMOFreeWiFi"
add_wifi_network "@NAIAT3FreeWIFI4ALL"
add_wifi_network "@EVIAFreeWiFi"
add_wifi_network "@Dubai Mall by EMAAR"
add_wifi_network "_WorldSquareFreeWifi_"
add_wifi_network "_FREE Smart WiFi @NAIA3"
add_wifi_network "_Free JFK WiFi"
add_wifi_network "_Free EWR Wifi"
add_wifi_network "_DarlingSquareFreeWifi_

# Restore SELinux state
setenforce "$old_se"

exit