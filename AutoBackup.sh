#!/bin/bash

# AutoBackup by Antoine P (AntoDev or AntoZzz)
# Not to blame if something goes wrong

expire=10 # Time in seconds between backup creation time and expiration

file_to_save="/home/testbackup" # Directory to be saved (absolute path required)
folder_backup="/home/AutoBackup/" # Directory where the backups are located (absolute path required with a "/" at the end)

# Do not touch after
echo -e " \n   AutoBackup – Created Antoine P\n   Source code on https://github.com/AntoZzz/AutoBackup\n\n   Detecting expired backup ..."

mkdir -p $folder_backup
cd $folder_backup
for f in $(ls | grep '.zip'); do
	re="bkp_([0-9-]{10})_([0-9]{2})\.([0-9]{2})\.([0-9]{2})\.zip"
	if [[ $f =~ $re ]]; then
		file_date="${BASH_REMATCH[1]} ${BASH_REMATCH[2]}:${BASH_REMATCH[3]}:${BASH_REMATCH[4]}"
		hasExpired=$(($(date -d "${file_date}" +%s) + $expire))
		if [[ $hasExpired < $(date +%s) ]]; then
			echo "   - Expired $f (Deleted!)"
			rm $f
		fi
	fi
done
echo -e "   Done !\n\n   Create backup for '$file_to_save' in '$folder_backup'"

newBackupFile=$folder_backup"bkp_$(date  +"%Y-%m-%d_%H.%M.%S").zip"
echo "   - Created backup in $newBackupFile"
zip -r  $newBackupFile $file_to_save > /dev/null
echo -e "   Done !\n"
