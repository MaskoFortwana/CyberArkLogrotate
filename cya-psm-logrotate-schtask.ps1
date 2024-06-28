# Name of the task
$taskName = "PSM Logrotate"

# Path to the script to run
$scriptPath = "C:\scripts\cya-psm-logrotate.ps1"

# Ensure the script exists
if (!(Test-Path -Path $scriptPath)) {
    Write-Host "The specified script path ($scriptPath) does not exist. Exiting."
    exit
}

# Task action
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File $scriptPath"

# Task trigger (daily at 4 AM)
$trigger = New-ScheduledTaskTrigger -Daily -At 4am

# Task folder
$taskFolder = "\CyberArk"

# Check if the folder exists and create it if not
if (!(Get-ScheduledTask | Where-Object { $_.TaskPath -eq $taskFolder })) {
    Write-Host "Creating folder $taskFolder in Task Scheduler."
    New-ScheduledTaskFolder -Path $taskFolder
}

# Full task path
$fullTaskPath = $taskFolder + "\" + $taskName

# Check if the task already exists
if (Get-ScheduledTask -TaskPath $fullTaskPath -ErrorAction SilentlyContinue) {
    Write-Host "Task $fullTaskPath already exists. Exiting."
    exit
}

# Create the task
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -TaskPath $taskFolder -User "NT AUTHORITY\SYSTEM"

Write-Host "Task $fullTaskPath created successfully."
