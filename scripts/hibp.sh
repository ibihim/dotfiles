#!/usr/bin/env bash

PASSWORD=$1
HASH=`echo -n $PASSWORD | sha1sum | awk '{ print $1 }' | tr a-z A-Z`
HASH_PREFIX=`echo $HASH | cut -c-5`
HASH_POSTFIX=`echo $HASH | cut -c 6-`

printf "Password hash is %s.\n\n" $HASH
printf "Searching for %s...\n\n" $HASH_PREFIX

FILE_NAME=$HASH_PREFIX.txt
if [ ! -e $FILE_NAME ]; then
    printf "%s files doesn't exist, querying hibp.\n" $FILE_NAME
    curl -s https://api.pwnedpasswords.com/range/$HASH_PREFIX > $HASH_PREFIX.txt
fi

COUNT=`wc -l < $FILE_NAME`
printf "Search for %s found %d candidates!\n" $HASH_PREFIX $COUNT
printf "Search through candidates for the rest:\n\t%s\n\n" $HASH_POSTFIX

RESULT=`rg $HASH_POSTFIX $FILE_NAME`

printf "Search through candidates hash found:\n\t%s\n\n" $RESULT

if [ -n "$RESULT" ]; then
    printf "Password has been leaked!\n"
else
    printf "Password has not been leaked!\n"
fi

