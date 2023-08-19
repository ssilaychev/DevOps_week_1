#!/bin/bash

# Check 1 - the  number of arguments for the script
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <directory_to_backup> <compression_algorithm> <output_file_name>" >> error.log
    exit 1
fi

BU_DIRECTORY=$1
COMPRESSION_ALGO=$2
OUTPUT_FILE=$3

# Check 2 - validity of a compression option
case $COMPRESSION_ALGO in
    none)
        TAR_OPTION=""
        ;;
    gzip)
        TAR_OPTION="z"
        ;;
    bzip)
        TAR_OPTION="j"
        ;;
    xz)
	TAR_OPTION="J"
	;;
    *)
        echo "Unsopported compression selected. Use none, gzip, bzip or xz." >> error.log
        exit 1
        ;;
esac

# Create backup and encrypt it
# Short description of some used elements:
## -c -> indicates that we create new archive
## f -> specifies filename to follow
## - in the end -> related to f option
## 2>> -> redirect and append a standard error to the file following arrows
## | -> pipe operator
## enc -> encryption indicator
## -aes-256-cbc -> cipher used for encryption
## -pbkdf2 -> ADDED AFTER initial errorl log checks. Option that is more secure for password derivation
## -iter 10000 -> ADDED AFTER initial error log checks. Option to define number of iterations for pbkdf2. Higher number => more secure, but less productive; and vice versa

tar -c${TAR_OPTION}f - "$BU_DIRECTORY" 2>> error.log | openssl enc -aes-256-cbc -pbkdf2 -iter 10000 -out "$OUTPUT_FILE" 2>> error.log

# Check that tar and openssl commands worked correctly
if [ $? -ne 0 ]; then
    echo "An error occurred: check the backup or encryption process" >> error.log
    exit 1
fi


exit 0
