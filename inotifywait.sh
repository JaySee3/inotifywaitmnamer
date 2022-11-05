#!/bin/sh

inotifywait --monitor --recursive -e moved_to /mnt/Watch |
    while read path action file; do
        echo "The file '$file' appeared in directory '$path' via '$action'"
        mnamer /mnt/Watch --config-path=/app/.mnamer-v2.json
    done