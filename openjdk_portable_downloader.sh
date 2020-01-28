#!/bin/bash

################################################################################
#                         openjdk_portable_downloader                          #
#                                                                              #
# Use this script to download latest openjdk binaries                          #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (C) 2020, @rfuehrer                                               #
#                                                                              #
# Permission is hereby granted, free of charge, to any person obtaining a copy #
# of this software and associated documentation files (the "Software"), to deal#
# in the Software without restriction, including without limitation the rights #
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell    #
# copies of the Software, and to permit persons to whom the Software is        #
# furnished to do so, subject to the following conditions:                     #
#                                                                              #
# The above copyright notice and this permission notice shall be included in   #
# all copies or substantial portions of the Software.                          #
#                                                                              #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR   #
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,     #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  #
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER       #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING      #
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS #
# IN.THE SOFTWARE.                                                             #
#                                                                              #
################################################################################
################################################################################
################################################################################

OVERWRITE_EXISTING=0
CLEANUP_DESTINATION=1
# relatibe path (from script location) to java storage path
DIR_DESTINATION="./java_portable"
SITE_OPENJDK="https://jdk.java.net/archive/"

# ----------------------- DO NOT EDIT BELOW THIS LINE -----------------------

# set internal vars
DIR_TEMP=$(mktemp -d)

ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIR_DESTINATION=$ABSOLUTE_PATH/$DIR_DESTINATION
echo "OpenJDK destination path  : $DIR_DESTINATION"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	PLATFORM="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	PLATFORM="osx"
elif [[ "$OSTYPE" == "cygwin" ]]; then
	PLATFORM="windows"
	echo "Platform not supported at the moment. Abort."
	exit 1
elif [[ "$OSTYPE" == "msys" ]]; then
	PLATFORM="windows"
	echo "Platform not supported at the moment. Abort."
	exit 1
elif [[ "$OSTYPE" == "win32" ]]; then
	Echo "Platform (32-bit) not supported. Abort."
	exit 1
elif [[ "$OSTYPE" == "freebsd"* ]]; then
	PLATFORM="linux"
else
	echo "Platform can not be detected. Abort."
	exit 1
fi


# get latest openjdk link
# get website content
DUMMY1=$(curl -s "$SITE_OPENJDK")
# get all links
DUMMY2=$(echo "$DUMMY1" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*(\.tar\.gz)")
# get first link auf all links of specified platform
DOWNLOAD=$(echo "$DUMMY2" | grep "$PLATFORM" | head -n 1)
# download openjdk
SITE_VERSION=$(echo "$DOWNLOAD" | sed -e 's#.*jdk-\(.*\)_.*#\1#' | sed -e 's#^\(.*\)_.*#\1#')

TEMPFILE="$DIR_TEMP/temp.openjdk-$PLATFORM-$SITE_VERSION.tar.gz"


# Cleaup obsolete versions
if [ $CLEANUP_DESTINATION -eq 1 ]; then
	echo "Clean up destination dir..."
	find "$DIR_DESTINATION/" -mindepth 1 -maxdepth 1 -not -name "openjdk-$PLATFORM-$SITE_VERSION" -print0 | xargs -0 rm -rf
fi

# check if platform/version already exists
if [[ -d "$DIR_DESTINATION/openjdk-$PLATFORM-$SITE_VERSION" ]]; then
    if [ $OVERWRITE_EXISTING -eq 0 ]; then
        echo "Version seems to exists in destination directory. Abort."
    	exit 1
    else
		echo "Overwritung existing version..."
	fi
fi

# downloading openjdk
echo "Downloading OpenJDK v.$SITE_VERSION / $PLATFORM. Please wait..."
curl -s -o "$TEMPFILE" "$DOWNLOAD"

# extract openjdk
tar -xf "$TEMPFILE" -C "$DIR_TEMP/" --strip=3
# get downloaded version
VERSION=$("$DIR_TEMP/Home/bin/java" --version | head -n 1 | awk '{ print $2 }')

# prepare destination directory
mkdir -p "$DIR_DESTINATION"
FINALDIR="$DIR_DESTINATION/openjdk-$PLATFORM-$SITE_VERSION"

echo "OS detected               : $PLATFORM"
echo "Temporary dir             : $DIR_TEMP"
#osascript -e "tell application \"System Events\" to display dialog \"DEBUG: $DIR_TEMP\""
echo "OpenJDK download link     : $DOWNLOAD"
echo "OpenJDK link version      : $SITE_VERSION"
echo "OpenJDK version           : $VERSION"
echo "OpenJDK destination path  : $DIR_DESTINATION"
echo "OpenJDK downloaded version: $FINALDIR"
echo "Please press CTRL+C to abort NOW! (waiting 5 seconds)"
sleep 5

echo "Remove old files and dirs..."
# remove old openjdk (if exists)
if [ ! -z "$FINALDIR" ]; then rm -rf "$FINALDIR/"; fi
# copy downloaded openjdk to destination
cp -Rp "$DIR_TEMP/Home" "$FINALDIR"
# copy downloaded tar to destination (as backup; will be deleted at next activated cleanup!)
#cp $TEMPFILE $DIR_DESTINATION/

# remove downloaded/extracted temp parts
if [ ! -z "$DIR_TEMP" ]; then rm -rf "$DIR_TEMP/"; fi
if [ -f "$TEMPFILE" ]; then rm -rf "$TEMPFILE"; fi

echo "Done."
