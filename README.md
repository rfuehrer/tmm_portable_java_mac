# tmm_portable_java_mac
Prepare TinyMediaManager (tmm) with portable java

1. Download latest Oracke SE (https://www.oracle.com/technetwork/java/javase/downloads/index.html) (NOTE: OpenJDK not supported; TMM won't start correctly)
2. Extract JDK (tar or dmg) archive locally (or view via "Suspicious Package")
3. Enter extracted archive folder
3. Navigate to ./Contents/Home
---
4. Open TMM Mac application in seperate Finder window (via "view content")
5. Navigate to ./Contents/Resources/Java
6. Create folder "java_portable" within this folder (./Contents/Resources/Home)
7. Navigate in this created folder (./Contents/Resources/Home/java_portable)
8. Create sub-folder with JDK version (e.g. "jdk-13.0.1.jdk")
9. Navigate to this created folder (./Contents/Resources/Home/portabple_java/jdk-13.0.1.jdk)
---
10. Copy all content of JDK finder window (note: important folders are "bin" and "lib")
11. Close all finder windows
---
12. Replace tinyMediaManagerOSX.sh with this version
13. Start the mac app
