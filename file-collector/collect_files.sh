#!/bin/bash

input_dir="$1"
output_dir="$2"

mycp() {
    local source="$1"
    local target_dir="$2"
    local filename=$(basename -- "$source")
    local name="${filename%.*}"
    local ext="${filename##*.}"
    local dest_path="$target_dir/$filename"
    local counter=1

    while [[ -e "$dest_path" ]]; do
        if [[ "$ext" != "$filename" ]]; then
            dest_path="$target_dir/${name}_${counter}.${ext}"
        else
            dest_path="$target_dir/${name}_${counter}"
        fi
        ((counter++))
    done

   cp -- "$source" "$dest_path"; 
}

