#!/bin/bash
if [ $# -eq 0 ]; then
        echo "No parameters supplied"
        exit 1
fi

xxd -r $1 > data
while true; do
        type=$(file data | awk '{print $2}')
        case $type in
                gzip)
                        mv data data.gz
                        gzip -d data.gz 2> /dev/null
                ;;
                bzip2)
                        bzip2 -d data 2> /dev/null
                        mv data.out data
                ;;
                POSIX)
                        extr=$(tar -xvf data)
                        mv $extr data
                ;;
                *)
                        cat data
                        exit 0
                ;;
        esac
done
