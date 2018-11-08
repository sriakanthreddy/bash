#!/bin/sh

delete() {
    echo "Deleting $1"
}

DOW=$(date +%u)

if [ $DOW -eq 1 ]; then
    DATE_DAY=$(date -d "-28 days" +"%d")
    if [ $DATE_DAY -gt 7 ]; then
        DATE=$(date -d "-28 days" +"%Y-%m-%d")
        delete $DATE
    fi

    DATE_DAY=$(date -d "-364 days" +"%d")
    DATE_MONTH=$(date -d "-364 days" +"%m")
    if [ $DATE_DAY -le 7 ] && [ $DATE_MONTH -gt 1 ]; then
        DATE=$(date -d "-364 days" +"%Y-%m-%d")
        delete $DATE
    fi
else
    DATE=$(date -d "-7 days" +"%Y-%m-%d")
    delete $DATE
fi
