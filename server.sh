#!/usr/bin/env bash

chmod +x $0

#bofh
server() {
    while true
    do
        nc -l -p 80 >data
    done
}

#webscale
worker() {
    while true
    do
        cat - >/dev/null
    done
}

usage() {
    man nc
    man cat
    man bash
}

THREADS=1

while test $# -gt 0
do
    case $1 in
        -h|--help)
            exec usage
            ;;
        -t|--thread-count)
            THREADS=$2
            shift
            ;;
    esac
    shift
done

for i in {1..THREADS}
do
    worker <data &
done

server
arst
