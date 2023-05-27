#!/usr/bin/env bash

# Loop through all files in the current directory
for file in *
do
  # Get the file name and extension
  filename=$(basename "$file")
  extension="${filename##*.}"
  filename="${filename%.*}"

  # Replace all special characters with _
  new_filename=$(echo "$filename" | sed -e 's/[^A-Za-z0-9._-]/_/g')

  # Rename the file
  mv -vi "$file" "${new_filename}.${extension}"
done
