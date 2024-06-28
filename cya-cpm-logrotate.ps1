# Define the paths
$folders = @(
    "C:\Program Files (x86)\CyberArk\Password Manager\Logs\old"
)

# Define the threshold date (2 weeks ago)
$threshold = (Get-Date).AddWeeks(-2)

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