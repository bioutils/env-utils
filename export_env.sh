#!/usr/bin/env bash
# simple function to export `.env` to environmental variables
# equivalent to 
#    
#    export $(grep -v '^#' my_custom.env | xargs)
#
# USAGE 
# need to source this file first, then can use function "_export_env" 
# 
# For example:
#  
#     source export_env.sh
#     _export_env custom.env
#     echo $SOMEVAR"
#

_export_env() {
    local name="$1"  # Use local to keep scope clean
    if [[ -z "$name" ]]; then
        # use .env by default if no name provided
        name=".env"
    fi

    # test if the desired `file.env` exists:
    if [ ! -f "$name" ]; then
        echo "File $name not found!"
        return 1 
    fi

    export $(grep -v '^#' "$name" | xargs)
}

