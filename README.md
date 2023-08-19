# DevOps_week_1
HSE MDS DevOps - week 1

Description.
Available files:
1 - README.md - iverview of HA and ways to test it
2 - week1_backup_script_silaychev.sh - scriot for backup with detailed comments
3 - error.log - log with errors during the code production phase.

HOW TO RUN?
- Save the code week1_backup_script_silaychev.sh on your PC
- Give execute permissions to the script:
  chmod +x week1_backup_script_silaychev.sh
- Run the script with the necessary parameters, e.g.
  ./week1_backup_script_silaychev.sh </path/to/directory> <gzip> <backup.tgz.enc>
  Where
    </path/to/directory> - is a directory you want to backup
    <gzip> - type of archive
    <backup.tgz.enc> - name of the output file

  It will request password for SHA-256 encryption.

Tested example:
  ./week1_backup_script_silaychev.sh </path/to/directory> <gzip> <backup.tgz.enc>
