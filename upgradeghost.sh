#/bin/bash
############################
# updgradeghost.sh
# This script creates a backup of ghost directories and then performs an upgrade 
############################

ghostDir=~/Documents/PersonalProjects/portfolio-site-ghost-theme/   #working ghost install
ghostBackupDir=~/Documents/PersonalProjects/backup-portfolio-site-ghost-theme/             # backup directory
ghostTemp=~/ghostTemp/ #temp directory used to download and extract ghost then removed.
ghostSource=https://ghost.org/zip/ghost-0.4.0.zip

timeStamp=$(date +"%Y%m%d%H%M")

# create backup directory 
echo "Creating $ghostBackupDir$timeStamp for backup of any existing files in $ghostDir"
mkdir -p $ghostBackupDir$timeStamp
echo "...done"

# change to the ghost directory
echo "Changing to the $ghostDir directory"
cd $ghostDir
echo "...done"

# copy any existing themes to backup 
echo "Backing up any themes from content/themes to $ghostBackupDir$timeStamp"
cp -r content/themes $ghostBackupDir$timeStamp

#copy any existing images to backup
echo "Backing up any images from content/image to $ghostBackupDir$timeStamp"
cp -r content/images $ghostBackupDir$timeStamp

#download the latest version of ghost to temp directory
echo "Downloading and extracting ghost"
mkdir -p $ghostTemp
cd $ghostTemp
wget $ghostSource
echo "...done"
echo "Extracting ghost "
unzip "*.zip" 
echo "...done"

#copy new files into existing install
echo "Copying new files into existing install"
cp *.md *.js *.txt *.json $ghostDir
echo "...done"

#delete old core directory
echo "Deleting old core directory.."
rm -rf $ghostDir/core
echo "...done"

#copy new core directory and all contents
echo "Upgrading core.."
cp -R core $ghostDir
echo "...done"

#upgrade casper theme
echo "Upgrading casper theme.."
cp -R content/themes/casper $ghostDir
echo "...done"

#install Ghost
echo "Installing ghost.."
cd $ghostDir
npm install --production
echo "...done"

#clean up downloaded files
echo "Removing downloaded files"
rm -rf $ghostTemp
echo "...done"

echo "Upgrade complete! You may now start ghost
