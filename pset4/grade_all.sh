#!/bin/bash

check() {
    for file in $(find . -type f -name "*$3*.c")
    do
        echo "------------- $1 (${PWD##*/}/${file:2}) -------------"
        check50 "$2" $4 "${file:2}" # $4 is optional helper file argument
        echo
    done
}

for  directory in $(find . -maxdepth 1 -type d)
do
    if [ "$directory" != "." ]
    then
        echo "<><><><><> GRADING $directory <><><><><>"
        cd "$directory"
            check "RESIZE LESS" "2016.resize.less" "resize" "bmp.h" | tee check50.txt
            check "RESIZE MORE" "2016.resize.more" "resize" "bmp.h" | tee -a check50.txt
            check "RECOVER"     "2016.recover"     "recover"        | tee -a check50.txt
        cd ../
    fi
done