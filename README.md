# TinyMediaManager (TMM) with portable Java (Mac)
Prepare TinyMediaManager (TMM) with portable Oracle Java

## Purpose
These instructions are for starting TinyMediaManager on the Mac with a portable version of Java. A portable version of Java is stored in the app and the start script of TMM is adapted.

The advantage of this approach is that no Java version has to be installed permanently on the Mac system, but is saved with the app.

A disadvantage is that the start script of TMM has to be adapted again after each update, because the update resets the shell script again. If TMM is started via an external script or macro (e.g. Keyboard Maestro), this can be ensured every time TMM is started.

## Restriction
- does not work with OpenJDK
- need to be prepared after every update of TMM

## Installation
1. Download latest Oracke SE (https://www.oracle.com/technetwork/java/javase/downloads/index.html) (NOTE: OpenJDK not supported; TMM won't start correctly)
2. Extract JDK (tar or dmg) archive locally (or view via "Suspicious Package")
3. Enter extracted archive folder
4. Navigate to ./Contents/Home

5. Open folder of TMM Mac application in seperate Finder window (via "view content") or console
6. Navigate to tinyMediaManager.app/Contents/Resources/Java
7. Create new folder "java_portable" within this folder (tinyMediaManager.app/Contents/Resources/Home)
8. Navigate in this created folder (tinyMediaManager.app/Contents/Resources/Home/java_portable)
9. Create sub-folder with JDK version (e.g. "jdk-13.0.1.jdk")
10. Navigate to this created folder (tinyMediaManager.app/Contents/Resources/Home/portabple_java/jdk-13.0.1.jdk)

11. Copy all content of JDK finder window (see step #3 and #4)  (note: important folders are "bin" and "lib") to JDK folder of step #9 and #10

12. Replace script tinyMediaManagerOSX.sh from this project to app home folder (tinyMediaManager.app/Contents/Resources/Home/)  
13. Close all finder windows
14. Start the mac app
