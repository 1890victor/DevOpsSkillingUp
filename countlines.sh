#!/bin/bash

# Function to display script usage
usage() {
    echo "Usage: $0 [-o <owner>] [-m <month>]"
    echo "Options:"
    echo "  -o <owner>     Select files where the owner is <owner>"
    echo "  -m <month>     Select files where the creation month is <month>"
    exit 1
}

# Function to count lines in text files based on owner
count_lines_by_owner() {
    local owner="$1"

    echo "Looking for files where the owner is: $owner"

    for file in *.txt; do
        local file_owner=""
        if [[ "$OSTYPE" == "darwin"* ]]; then
            file_owner=$(stat -f '%Su' "$file")
        else
            file_owner=$(stat -c '%U' "$file")
        fi

        if [ "$file_owner" = "$owner" ]; then
            local lines=$(wc -l < "$file")
            echo "File: $file, Lines: $lines"
        fi
    done
}

# Function to count lines in text files based on creation month
count_lines_by_month() {
    local month="$1"

    echo "Looking for files where the month is: $month"

    for file in *.txt; do
        local creation_month=""
        if [[ "$OSTYPE" == "darwin"* ]]; then
            creation_month=$(stat -f '%Sm' -t '%b' "$file")
        else
            creation_month=$(stat -c '%y' "$file" | awk '{print $2}')
        fi

        if [ "$creation_month" = "$month" ]; then
            local lines=$(wc -l < "$file")
            echo "File: $file, Lines: $lines"
        fi
    done
}


while getopts ":o:m:" opt; do
    case $opt in
        o)
            count_lines_by_owner "$OPTARG"
            ;;
        m)
            count_lines_by_month "$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument" >&2
            usage
            ;;
    esac
done

# Show help if no arguments provided
if [ $# -eq 0 ]; then
    usage
fi