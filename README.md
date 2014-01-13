# About

A script to help automate upgrading Ghost (https://ghost.org/). This script backs up content/themes and content/images. It does not back up your database or dump the json (yet). The script will download and extract the ghost archive.

#Requirements
This script requires wget. If you are on OS X and have homebrew installed then you can run "brew install wget". If you do not have homebrew installed then follow these instructions: http://osxdaily.com/2012/05/22/install-wget-mac-os-x/

#Usage

1. Download the script.
2. Update directory variables to match your install, backup, ghost zip url, and temp locations. The temp directory is removed upon completion.
3. Make sure the script is executable
4. Execute the script.
5. Start Ghost.
