Set-StrictMode -Version Latest

function Add-WifiNetwork {
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Ssid
    )

    # Mirror create.sh: file name pattern "Wi-Fi-<ssid>.xml"
    # (but make it filesystem-safe so SSIDs like "A/B" won't break file creation)
    $invalid = [IO.Path]::GetInvalidFileNameChars()
    $safeSsidForFile = ($Ssid.ToCharArray() | ForEach-Object { if ($invalid -contains $_) { '_' } else { $_ } }) -join ''
    $xmlFile = "Wi-Fi-$safeSsidForFile.xml"

    # Mirror create.sh: open network profile + MAC randomization block
    $escapedSsid = [System.Security.SecurityElement]::Escape($Ssid)
    $xml = @"
<?xml version="1.0"?>
<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1">
    <name>$escapedSsid</name>
    <SSIDConfig>
        <SSID>
            <name>$escapedSsid</name>
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
"@

    $xml | Out-File -FilePath $xmlFile -Encoding UTF8 -Force

    # Mirror import.ps1: import using netsh
    netsh wlan add profile filename="$xmlFile"
}

# Example:
Add-WifiNetwork "WiFi_Chefexpress"
Add-WifiNetwork "WiFi Frecciarossa"
Add-WifiNetwork "WiFi Frecciargento"
Add-WifiNetwork "WendysWifi"
Add-WifiNetwork "Wawa WiFi"
Add-WifiNetwork "Walmartwifi"
Add-WifiNetwork "Telstra"
Add-WifiNetwork "Taronga Guest WiFi"
Add-WifiNetwork "Sydney Tower - Guest"
Add-WifiNetwork "SWP_Lounges_Wifi"
Add-WifiNetwork "Starhotels"
Add-WifiNetwork "Starbucks WiFi"
Add-WifiNetwork "SolenadFreeWIFI4ALL"
Add-WifiNetwork "Smashburger Guest"
Add-WifiNetwork "skynetglobal"
Add-WifiNetwork "Shangri-La"
Add-WifiNetwork "Scenic World Free Wifi"
Add-WifiNetwork "Rydges World Square"
Add-WifiNetwork "RhB-FREE"
Add-WifiNetwork "QF-Guest"
Add-WifiNetwork "Portaleregionale"
Add-WifiNetwork "PAL_Wi-Fi"
Add-WifiNetwork "OperaHouse_FreeWiFi"
Add-WifiNetwork "OnAir"
Add-WifiNetwork "Olive Garden Guest"
Add-WifiNetwork "My Autogrill WI-FI"
Add-WifiNetwork "merz-gast"
Add-WifiNetwork "Merlin_Guest"
Add-WifiNetwork "McDonald's Free WiFi"
Add-WifiNetwork "Max's WiFi"
Add-WifiNetwork "Maccas Free Wi-fi"
Add-WifiNetwork "KFC Free Wifi"
Add-WifiNetwork "InfoTrainment"
Add-WifiNetwork "IBIS"
Add-WifiNetwork "Hungry Jack's FREE WiFi"
Add-WifiNetwork "hideaway "
Add-WifiNetwork "H&M Free WiFi"
Add-WifiNetwork "Grill'd Guest"
Add-WifiNetwork "Glowworm Caves Guest"
Add-WifiNetwork "FreeWiFi@SYD"
Add-WifiNetwork "FreeWiFi-NARITA(2.4G)"
Add-WifiNetwork "FreeWiFi-NARITA"
Add-WifiNetwork "FreeWiFi-NARITA-main(5G)"
Add-WifiNetwork "FreeMSGWIFI"
Add-WifiNetwork "Free_WiFi_GVA"
Add-WifiNetwork "Free WiFi"
Add-WifiNetwork "Free Telstra Wi-Fi"
Add-WifiNetwork "Free Skyline Internet"
Add-WifiNetwork "Fountains"
Add-WifiNetwork "EmiliaRomagnaWiFi wifiprivacy.it"
Add-WifiNetwork "Edelweiss"
Add-WifiNetwork "DIHDXB"
Add-WifiNetwork "digitalelpaso"
Add-WifiNetwork "CP WIFI"
Add-WifiNetwork "ConvergeFreeWifi_NAIAT3_5G"
Add-WifiNetwork "Comune di Tirano WiFi Free"
Add-WifiNetwork "ClientScape"
Add-WifiNetwork "CircuitLaneFreeWIFI4ALL"
Add-WifiNetwork "CBP_GUEST"
Add-WifiNetwork "BoldynWiFi"
Add-WifiNetwork "Boingo Hotspot"
Add-WifiNetwork "Auckland Airport"
Add-WifiNetwork "Atrium"
Add-WifiNetwork "Apple Store"
Add-WifiNetwork "Apple Demo"
Add-WifiNetwork "Animo Student"
Add-WifiNetwork "Animo Connect"
Add-WifiNetwork "ACCOR"
Add-WifiNetwork "#Wifi@Jewel"
Add-WifiNetwork "#WiFi@Changi"
Add-WifiNetwork "#Guest WiFi"
Add-WifiNetwork "#GigaSmartWiFi"
Add-WifiNetwork "#DXB Free WiFi"
Add-WifiNetwork "@WiFi UAE from du"
Add-WifiNetwork "@SOMOFreeWiFi"
Add-WifiNetwork "@NAIAT3FreeWIFI4ALL"
Add-WifiNetwork "@EVIAFreeWiFi"
Add-WifiNetwork "@Dubai Mall by EMAAR"
Add-WifiNetwork "_WorldSquareFreeWifi_"
Add-WifiNetwork "_FREE Smart WiFi @NAIA3"
Add-WifiNetwork "_Free JFK WiFi"
Add-WifiNetwork "_Free EWR Wifi"
Add-WifiNetwork "_DarlingSquareFreeWifi_"