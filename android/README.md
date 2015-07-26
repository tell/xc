# Cross-Compilations for Android

## Directories

* `ndk-standalone`
* `openssl`
* `gmp`
* `prefix`: cross-compiled binaries are installed into this directory.

## How to Use

First of all, `ndk-standalone` is needed to build other packages. Thus, build it, and then go to other subdirectories.

Built binaries, headers, and documents will be installed into a directory `prefix`.

A usage of the packages in this directory, load `ndk-standalone/setenv.sh` to use the standalone compiler, and then refer the directory `prefix` to use header files and libraries.
