# Log Rotation Scripts Documentation

This document outlines the usage and configuration of log rotation scripts for CyberArk components. These scripts help in managing log file sizes by automatically deleting old log files based on predefined retention policies.

## PowerShell Scripts

### Setup

1. Copy the PowerShell scripts to `C:\scripts\`.
2. Run the `*schtask.ps1` script to create a scheduled task.
3. Review the `*logrotate.ps1` script to see its settings.

### CPM Log Rotation Defaults

- **Location**: Deletes log files from `C:\Program Files (x86)\CyberArk\Password Manager\Logs\old`.
- **Retention**: 2 weeks.

### PSM Log Rotation Defaults

- **Location**: Deletes log files from the following directories:
    - `C:\Program Files (x86)\CyberArk\PSM\Logs\Components`
    - `C:\Program Files (x86)\CyberArk\PSM\Logs\Components\old`
    - `C:\Program Files (x86)\CyberArk\PSM\Logs\old`
- **Retention**: 1 month.

## Bash Script

### Setup

1. Copy the bash script into any folder.
2. Add it to crontab, for example:
   `0 23 * * * /home/scripts/psms-logrotate.sh`

### PSMS Log Rotation Defaults

- **Location**: Deletes log files from:
    - `/var/opt/CARKpsmp/logs/`
    - `/var/opt/CARKpsmp/logs/old/`
    - `/var/opt/CARKpsmp/logs/components/`
    - `/var/opt/CARKpsmp/logs/components/old/`
- **Retention**: 10 days.
- **Customization**: Change retention by editing the "mtime" parameter in the script.
