# AutoBackup

Automatic management of backups (folder creation and deletion)

### Configuration

```bash
expire=10 # Time in seconds between backup creation time and expiration

file_to_save="/home/testbackup" # Directory to be saved (absolute path required)
folder_backup="/home/AutoBackup/" # Directory where the backups are located (absolute path required with a "/" at the end)
```

### Setup & Run

1. Do `git clone https://github.com/AntoZzz/AutoBackup && cd AutoBackup`
1. Do `bash AutoBackup`

### With Cron (Linux)

1. Do `crontab -e`
2. Add `[minute] [hour] * * * bash [Absolute path to script]/AutoBackup.sh`

More details on http://www.linux-france.org/article/man-fr/man5/crontab-5.html

Thank you !
