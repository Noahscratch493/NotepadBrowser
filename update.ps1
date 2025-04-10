# === Configurations ===
$mainServer = 'https://raw.githubusercontent.com/Noahscratch493/NotepadBrowser/main/server'
$serverUrl = ""

# Function to download the sites.txt file
function Download-SitesFile {
    param(
        [string]$url,
        [string]$outputPath
    )

    try {
        Write-Host "Attempting to download sites.txt from $url..."
        Invoke-WebRequest -Uri $url -OutFile $outputPath
        Write-Host "sites.txt successfully downloaded to $outputPath"
    }
    catch {
        Write-Host "Failed to download sites.txt. Error: $_"
    }
}

# Function to download a site page based on the site name
function Download-SitePage {
    param(
        [string]$siteName,
        [string]$serverUrl
    )

    # Define the output path with the new folder structure
    $pageDir = "app\pages\txt\$siteName"
    $pageUrl = "$serverUrl/$siteName/page.txt"
    $outputPath = "$pageDir\page.txt"

    # Create the directory if it doesn't exist
    if (-not (Test-Path $pageDir)) {
        Write-Host "Creating directory: $pageDir"
        New-Item -Path $pageDir -ItemType Directory
    }

    # Download the page
    try {
        Write-Host "Attempting to download page.txt for $siteName from $pageUrl..."
        Invoke-WebRequest -Uri $pageUrl -OutFile $outputPath
        Write-Host "Page for $siteName successfully downloaded to $outputPath"
    }
    catch {
        Write-Host "Failed to download page.txt for $siteName. Error: $_"
    }
}

# Function to clean up (delete) sites.txt after usage
function Clean-UpSitesFile {
    if (Test-Path "sites.txt") {
        Remove-Item "sites.txt"
        Write-Host "sites.txt has been deleted after use."
    }
    else {
        Write-Host "No sites.txt found to delete."
    }
}

# === Ask user for server choice ===
cls
Write-Host "==============================="
Write-Host "     Notepad Browser Updater   "
Write-Host "==============================="
Write-Host ""
Write-Host "Choose server to update sites from:"
Write-Host "[1] Main Server"
Write-Host "[2] Enter custom server URL"
Write-Host ""

$choice = Read-Host "Enter choice"

if ($choice -eq "1") {
    $serverUrl = $mainServer
}
elseif ($choice -eq "2") {
    $serverUrl = Read-Host "Enter full URL to server (ending in /)"
}
else {
    Write-Host "Invalid choice. Exiting."
    exit
}

# === Download sites.txt from the selected server ===
$sitesFileUrl = "$serverUrl/sites.txt"
Download-SitesFile -url $sitesFileUrl -outputPath "sites.txt"

# === Check if sites.txt is downloaded successfully ===
if (Test-Path "sites.txt") {
    Write-Host "sites.txt downloaded successfully."
    
    # === Read the sites.txt file and process each site ===
    $siteNames = Get-Content -Path "sites.txt"
    
    foreach ($siteName in $siteNames) {
        Write-Host "Updating site: $siteName"
        
        # Download the site page
        Download-SitePage -siteName $siteName -serverUrl $serverUrl
    }

    Write-Host "All sites updated successfully."
}
else {
    Write-Host "Failed to download sites.txt. Please check the server URL."
}

# === Clean up the sites.txt file after usage ===
Clean-UpSitesFile

cls
Write-Host "Process complete. Press any key to exit."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
