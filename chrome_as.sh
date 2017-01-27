#!/bin/bash

# Start Chrome with profile directory 
# /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=/tmp/chrome.profile

if [ $# -eq 0  ]; then
  echo "please specify the profile name as argument"
  echo "ex: $0 user1"
  exit 1
fi

AS=$1

CHROME_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
# Change this variable to your path
PROFILE_BASE_PATH="EDIT_YOUR_PATH"
BASE_NAME="chrome.profile"

PROFILE_TEMPLATE="$BASE_NAME.template"
PROFILE_AS="$BASE_NAME.$AS"

# Remove the template history if exist
# rm -rf $PROFILE_BASE_PATH/$PROFILE_AS

# Copy the template base to the new directory
cp -a "$PROFILE_BASE_PATH/$PROFILE_TEMPLATE" "$PROFILE_BASE_PATH/$PROFILE_AS" &&

# Start chrome
"$CHROME_PATH" --user-data-dir="$PROFILE_BASE_PATH/$PROFILE_AS" 2>/dev/null &&

# Delete the profile when it's done
rm -rf "$PROFILE_BASE_PATH/$PROFILE_AS"
