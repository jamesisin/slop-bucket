# sudo crontab -e
# 0 4 * * 1 /home/[scriptpath] >/dev/null 2>&1


# redirect from script --> sends all STDERR to log file; use dated file on desktop

logfile="/home/jamesisi/Desktop/$(date +%Y%m%d)"
exec 2>> "${logfile}"


## backup Tunas


if ! mountpoint -q /media/BUTunas
   then
      mount -t ext4 -U ee44ee33-af22-4424-9f23-d61cc8cd5f15 /media/BUTunas
fi

# confirm mount

if [ `stat -fc%d:%T "/media/BUTunas"` != `stat -fc%d:%T "/media/BUTunas/.."` ]; then
   printf "\n\n/media/BUTunas is mounted.\n\n"
else
   printf "\n\n/media/BUTunas is not mounted.\nAbort!\n\n"
   exit 1
fi

# Note rsync -a copies permissions but will not copy owner:group if not run as root

chmod -R 755 /media/Tunas/iTuna/

# rsync -aiSP --delete /media/Tunas/iTuna/ /media/BUTunas/iTuna/
# rsync -aiSPH --delete /media/Tunas/MixedTapes/ /media/BUTunas/MixedTapes/

rsync -aiSPH --delete /media/Tunas/ /media/BUTunas/


umount /media/BUTunas
printf "\n\nBUTunas should now be unmounted.\n\n"


## backups Works


if ! mountpoint -q /media/BUWorks
   then
      mount -t ext4 -U 1b21d612-af61-4704-8bdb-24cff9b3a14c /media/BUWorks
fi

# confirm mount

if [ `stat -fc%d:%T "/media/BUWorks"` != `stat -fc%d:%T "/media/BUWorks/.."` ]; then
   printf "\n\n/media/BUWorks is mounted.\n\n"
else
   printf "\n\n/media/BUWorks is not mounted.\nAbort!\n\n"
   exit 1
fi

# Note: rsync -a copies permissions but will not copy owner:group if not run as root.

rsync -aiSP --delete /media/Works/Archive/ /media/BUWorks/Archive/
rsync -aiSP --delete /media/Works/ArtIsIn/ /media/BUWorks/ArtIsIn/
rsync -aiSP --delete /media/Works/CorruptedFiles/ /media/BUWorks/CorruptedFiles/
rsync -aiSP --delete /media/Works/JamesIsIn/ /media/BUWorks/JamesIsIn/
rsync -aiSP --delete /media/Works/Prawns/ /media/BUWorks/Prawns/


umount /media/BUWorks
printf "\n\nBUWorks should now be unmounted.\n\n"


# Test and remove empty log file.

if [[ -s "${logfile}" ]] ;
   then
      printf "\n\nThere were errors.\n\n"
      exit 1
   else
      printf "\n\nDone.\n\n"
      rm "${logfile}"
      exit 0
fi


exit