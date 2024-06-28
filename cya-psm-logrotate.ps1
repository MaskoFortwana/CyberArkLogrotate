# Define the paths
$folders = @(
    "C:\Program Files (x86)\CyberArk\PSM\Logs\Components"
    "C:\Program Files (x86)\CyberArk\PSM\Logs\Components\old"
    "C:\Program Files (x86)\CyberArk\PSM\Logs\old"
)

# Define the threshold date (1 month ago)
$threshold = (Get-Date).AddMonths(-1)

# Loop through each folder and find files
foreach ($folder in $folders) {
    # Ensure the folder exists
    if (Test-Path -Path $folder) {
        Get-ChildItem -Path $folder -Filter "*.log" | Where-Object {
            $_.LastWriteTime -lt $threshold
        } | ForEach-Object {
            Write-Host ("Deleting file: " + $_.FullName)
            Remove-Item $_.FullName -Force
        }
    }
}

Write-Host "Script completed."
