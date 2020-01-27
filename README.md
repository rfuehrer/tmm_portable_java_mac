# TinyMediaManager (TMM) with portable Java (Mac)
Prepare TinyMediaManager (TMM) with portable Oracle Java

## Purpose

The main reason for this project is that I don't want to burden my system with a permanently installed Java. The previous integrations have been too hard for me and I consider the installation of a deeply integrated program for the use of only one tool to be inappropriate. 

Therefore I was looking for a way to use Java on the Mac similar to the PortableApps on Windows. This should not be a deep installation into the calling system.

The following approach is based on the program tinyMediaManeger (TMM). TMM is called as a Mac app encapsulated bash script, which can be used to control its own Java interpreter.

## Background
These instructions are for starting TinyMediaManager on the Mac with a portable version of Java. A portable version of Java is stored in the app and the start script of TMM is adapted.

## Restriction
A disadvantage is that the start script of TMM has to be adapted again after each update, because the update resets the shell script again. If TMM is started via an external script or macro (e.g. Keyboard Maestro), this can be ensured every time TMM is started.

## Installation
1. Copy (and replace existing files) both shell scripts inside tinyMediaManager.app (mac) to [...]/tinyMediaManager.app/Contents/Ressources/Java
2. Close all finder windows
3. Start the mac app
4. Repeat steps 1-3 after every TMM update (or call TMM via a preparation program/script)
