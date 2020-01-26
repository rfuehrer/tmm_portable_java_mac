# TinyMediaManager (TMM) with portable Java (Mac)
Prepare TinyMediaManager (TMM) with portable Oracle Java

## Purpose
These instructions are for starting TinyMediaManager on the Mac with a portable version of Java. A portable version of Java is stored in the app and the start script of TMM is adapted.

The advantage of this approach is that no Java version has to be installed permanently on the Mac system, but is saved with the app.

A disadvantage is that the start script of TMM has to be adapted again after each update, because the update resets the shell script again. If TMM is started via an external script or macro (e.g. Keyboard Maestro), this can be ensured every time TMM is started.

## Restriction
- need to be prepared after every update of TMM

## Installation
1. Copy (and replace if existing) both shell scripts inside tinyMediaManager.app (mac) to [...]/tinyMediaManager.app/Contents/Ressources/Java
2. Close all finder windows
3. Start the mac app
