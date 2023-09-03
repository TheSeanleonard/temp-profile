#!/bin/bash

# Set the server address
serverAddress="mc.website3.cf:2762"

# Set the title
printf -v title "Minecraft Bedrock Proxy [%s]" "$serverAddress"
echo -ne "\033]0;$title\007"

# Define the URL and file name
downloadURL="https://github.com/jhead/phantom/releases/download/v0.5.4/phantom-linux"
fileName="phantom-linux"

# Check if the file exists, and if not, download it using curl
if [ ! -f "$fileName" ]; then
    echo "File not found. Downloading $fileName..."

    # Download the file using curl
    if ! curl -LO "$downloadURL"; then
        echo "Error downloading $fileName. Check your internet connection or the download URL."
        exit 1
    fi

    # Check if the file was downloaded successfully
    if [ -f "$fileName" ]; then
        echo "File $fileName downloaded successfully."
    else
        echo "Error downloading $fileName. Check your internet connection or the download URL."
        exit 1
    fi
fi

# Run the command
chmod +x "$fileName"
"./$fileName" -server "$serverAddress"

# Pause until a key is pressed
read -n 1 -s -r -p "Press any key to continue..."
