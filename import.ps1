Set-StrictMode -Version Latest

function Add-WifiNetwork {
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Ssid,

        # Optional WPA2 password (PSK). If omitted/empty => OPEN network profile.
        [Parameter(Mandatory = $false, Position = 1)]
        [string]$Password
    )

    # Resolve %USERPROFILE%\Downloads
    $downloads = Join-Path $env:USERPROFILE "Downloads"
    if (-not (Test-Path $downloads)) {
        New-Item -ItemType Directory -Path $downloads | Out-Null
    }

    # Make SSID filesystem-safe for the XML filename
    $invalidChars = [IO.Path]::GetInvalidFileNameChars()
    $safeSsidForFile = ($Ssid.ToCharArray() | ForEach-Object {
        if ($invalidChars -contains $_) { '_' } else { $_ }
    }) -join ''

    $xmlPath = Join-Path $downloads "Wi-Fi-$safeSsidForFile.xml"

    # Escape SSID/password for XML element content
    $escapedSsid = [System.Security.SecurityElement]::Escape($Ssid)
    $escapedPwd  = [System.Security.SecurityElement]::Escape($Password)

    # Decide profile security based on whether password is present
    $usePassword = -not [string]::IsNullOrWhiteSpace($Password)

    if ($usePassword) {
        # Basic WPA2-PSK sanity check (typical PSK rules: 8..63 chars for passphrase)
        if ($Password.Length -lt 8 -or $Password.Length -gt 63) {
            throw "Password length must be 8..63 characters for WPA2-PSK passphrases."
        }

        $securityBlock = @"
    <security>
        <authEncryption>
            <authentication>WPA2PSK</authentication>
            <encryption>AES</encryption>
            <useOneX>false</useOneX>
        </authEncryption>
        <sharedKey>
            <keyType>passPhrase</keyType>
            <protected>false</protected>
            <keyMaterial>$escapedPwd</keyMaterial>
        </sharedKey>
    </security>
"@
    } else {
        $securityBlock = @"
    <security>
        <authEncryption>
            <authentication>open</authentication>
            <encryption>none</encryption>
            <useOneX>false</useOneX>
        </authEncryption>
    </security>
"@
    }

    # Build WLAN profile XML
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
$securityBlock
    </MSM>
    <MacRandomization xmlns="http://www.microsoft.com/networking/WLAN/profile/v3">
        <enableRandomization>true</enableRandomization>
    </MacRandomization>
</WLANProfile>
"@

    # Write, import, then always delete the XML
    $xml | Out-File -FilePath $xmlPath -Encoding UTF8 -Force

    try {
        netsh wlan add profile filename="$xmlPath"
    }
    finally {
        if (Test-Path $xmlPath) {
            Remove-Item -Path $xmlPath -Force
        }
    }
}

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