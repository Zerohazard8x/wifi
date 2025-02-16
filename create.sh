#!/bin/bash

# Function to create a Wi-Fi profile XML file
create_wifi_profile() {
    local wifi_name="$1"  # Capture the first argument as the Wi-Fi name
    local file_name="Wi-Fi-${wifi_name}.xml"  # Construct the file name
    
    # Use a heredoc to write the XML content to the file
    cat > "$file_name" <<EOF
<?xml version="1.0"?>
<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1">
    <name>$wifi_name</name>
    <SSIDConfig>
        <SSID>
            <name>$wifi_name</name>
        </SSID>
    </SSIDConfig>
    <connectionType>ESS</connectionType>
    <connectionMode>auto</connectionMode>
    <MSM>
        <security>
            <authEncryption>
                <authentication>open</authentication>
                <encryption>none</encryption>
                <useOneX>false</useOneX>
            </authEncryption>
        </security>
    </MSM>
    <MacRandomization xmlns="http://www.microsoft.com/networking/WLAN/profile/v3">
        <enableRandomization>true</enableRandomization>
    </MacRandomization>
</WLANProfile>
EOF
    
    echo "'$file_name' created"
}

# android
create_wifi_profile() {
    # NOTE: replace " " with "\ "
    # adb shell "am start -n com.steinwurf.adbjoinwifi/.MainActivity -e ssid $1" # https://github.com/steinwurf/adb-join-wifi
    adb shell "am start -n com.adbwifisettingsmanager/.WifiSettingsManagerActivity --esn newConnection -e ssid $1" # https://github.com/pr4bh4sh/adb-wifi-setting-manager
}

create_wifi_profile "#Wifi@Jewel"
create_wifi_profile "_DarlingSquareFreeWifi_"
create_wifi_profile "_FREE Smart WiFi @NAIA3"
create_wifi_profile "_WorldSquareFreeWifi_"
create_wifi_profile "Auckland Airport"
create_wifi_profile "ConvergeFreeWifi_NAIAT3_5G"
create_wifi_profile "CP WIFI"
create_wifi_profile "Free Skyline Internet"
create_wifi_profile "Free Telstra Wi-Fi"
create_wifi_profile "FreeWiFi@SYD"
create_wifi_profile "Glowworm Caves Guest"
create_wifi_profile "Grill'd Guest"
create_wifi_profile "KFC Free Wifi"
create_wifi_profile "Maccas Free Wi-fi"
create_wifi_profile "Merlin_Guest"
create_wifi_profile "OperaHouse_FreeWiFi"
create_wifi_profile "QF-Guest"
create_wifi_profile "Scenic World Free Wifi"
create_wifi_profile "Shangri-La"
create_wifi_profile "skynetglobal"
create_wifi_profile "Sydney Tower - Guest"
create_wifi_profile "Taronga Guest WiFi"
create_wifi_profile "Telstra"
create_wifi_profile "Apple Demo"
create_wifi_profile "Apple Store"
create_wifi_profile "Hungry Jack's FREE WiFi"
create_wifi_profile "@EVIAFreeWiFi"
create_wifi_profile "CircuitLaneFreeWIFI4ALL"
create_wifi_profile "_Free EWR Wifi"
create_wifi_profile "BoldynWiFi"
create_wifi_profile "Free WiFi"
create_wifi_profile "FreeWiFi-NARITA"
create_wifi_profile "FreeWiFi-NARITA(2.4G)"
create_wifi_profile "FreeWiFi-NARITA-main(5G)"
create_wifi_profile "Olive Garden Guest"
create_wifi_profile "Wawa WiFi"
create_wifi_profile "digitalelpaso"
create_wifi_profile "Fountains"
create_wifi_profile "Starbucks WiFi"
create_wifi_profile "Walmartwifi"
