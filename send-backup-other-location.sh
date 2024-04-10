#!/bin/bash

# Author Siim Aarmaa @ 10.04.2024
# URL: https://aarmaa.ee

# Variables
FOLDER_PATH="path/to/file" # Path to the folder you want to tar and upload
NEXTCLOUD_USER="username" # Your Nextcloud username
NEXTCLOUD_PASSWORD="password" # Your Nextcloud password
NEXTCLOUD_WEBDAV_URL="https://example.com/remote.php/dav/files/username/" # Your Nextcloud WebDAV URL

# Find and process each matching .tar.gz file
find "$FOLDER_PATH" -type f -name "app_*.tar.gz" | while read -r FILE_PATH; do
    # Append .tar to the filename
    FILE_NAME=$(basename "$FILE_PATH")

    # Upload the file to Nextcloud via WebDAV
    curl -u "${NEXTCLOUD_USER}:${NEXTCLOUD_PASSWORD}" -T "${FILE_PATH}" "${NEXTCLOUD_WEBDAV_URL}${FILE_NAME}"

done
