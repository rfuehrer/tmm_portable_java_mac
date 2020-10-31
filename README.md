# TinyMediaManager 3.x (TMM) with portable Java (Mac)
Prepare TinyMediaManager 3.x (TMM) with portable Oracle Java

>Update to tinyMediaManager 4.x:
>
>TMM 4.x now manages its own Java dependencies, so this project should no longer be necessary.
>
>Since TMM 4.x requires a license for unrestricted use, this repo might still be interesting for users of TMM 3.x . 
>
>However, due to this evolution, this repo will no longer be actively maintained, as the changes to TMM 3.x will be limited to critical hotfixes and the structure of TMM 3.x should not change fundamentally.
>
>If there is still a need for an adjustment, please contact me via an issue or PR and the changes will be implemented.

## Purpose

The main reason for this project is that I don't want to burden my system with a permanently installed Java. The previous integrations have been too hard for me and I consider the installation of a deeply integrated program for the use of only one tool to be inappropriate. 

Therefore I was looking for a way to use Java on the Mac similar to the PortableApps on Windows. This should not be a deep installation into the calling system.

The following approach is based on the program tinyMediaManeger 3.x (TMM). TMM 3.x is called as a Mac app encapsulated bash script, which can be used to control its own Java interpreter.

## Background
These instructions are for starting TMM 3.x on the Mac with a portable version of Java. A portable version of Java is stored in the app and the start script of TMM is adapted.

## Restriction
A disadvantage is that the start script of TMM 3.x has to be adapted again after each update, because the update resets the shell script again. If TMM 3.x is started via an external script or macro (e.g. Keyboard Maestro), this can be ensured every time TMM is started.

## Installation
1. Copy (and replace existing files) both shell scripts inside tinyMediaManager.app (mac) to [...]/tinyMediaManager.app/Contents/Ressources/Java
2. Close all finder windows
3. Start the mac app
4. Repeat steps 1-3 after every TMM update (or call TMM via a preparation program/script)

## License

MIT, see [LICENSE](LICENSE) file.

## Note on the reuse of the approach

If you need a portable OpenJDK for another Mac project, just take the file `openjdk_portable_downloader.sh` from the project and include it in your project.
