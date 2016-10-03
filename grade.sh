#!/bin/bash

check() {
    for file in $(find . -type f -name "*$1*.c")
    do
        echo "------------- $2 (${PWD##*/}/${file:2}) -------------"
        check50 "$3" "${file:2}"
        echo
    done
}


echo "-----------------------------------------------------------------"

check "helpers" "FIND LESS" "2016.find.less" | tee check50.txt
check "fifteen" "FIFTEEN"   "2016.fifteen" | tee -a check50.txt

