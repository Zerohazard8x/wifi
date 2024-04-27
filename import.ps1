# Import all WLAN XML-files from specified directory
$XmlDirectory = "."

# Get all XML files in the directory
$XmlFiles = Get-ChildItem -Path $XmlDirectory -Filter "*.xml"

# Loop through each XML file
foreach ($File in $XmlFiles) {
    # Construct the full path for each file
    $FilePath = Join-Path -Path $XmlDirectory -ChildPath $File.Name

    # Try to add the WLAN profile using netsh
    try {
        $output = netsh wlan add profile filename="$FilePath"
        Write-Verbose "Added profile for ${FilePath}: $output"
    } catch {
        Write-Warning "Failed to add profile for ${FilePath}: $_"
    }
}
