sudo restic --exclude={/dev,/media,/mnt,/proc,/run,/sys,/tmp,/var/tmp} -r /mnt/backup/`hostname` backup /
