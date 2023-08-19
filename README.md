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

  It will request password for encryption (AES-256-CBC). Verify password as well.

Tested example:
  ./week1_backup_script_silaychev.sh test_dir gzip 20230819_backup.tgz.enc
  
HOW TO CHECK THE PROGRESS?
- Write
  cat error.log
    to check the output in case of errors


HOW TO OPEN THE BACKUP?
- Step 1
-   Write:
-   openssl enc -aes-256-cbc -d -in 20230819_backup.tgz.enc -out 20230819_backup.tgz -pbkdf2
-     To remove the encryption, put the password you used earlier

- Step 2
-   Write
-   mkdir check
-     to create the folder for a backup
-   tar -xzf 20230819_backup.tgz -C check/
-     to unarchive the backup in the folder called "check"

- Folder check should contain files from "test_dir" that we backed up.
