# Cross-Compilations for Android

## Directories

* `ndk-standalone`
* `openssl`
* `gmp`
* `prefix`: cross-compiled binaries are installed into this directory.

## How to Use

First of all, `ndk-standalone` is needed to build other packages. Then please go to other subdirectories.

Built binaries, headers, and documents will be installed into a directory `prefix`.

An example of usage of the packages in this directory:
```
$ cd ndk-standalone
$ . setenv.sh
$ cd ..
$ export LDFLAGS="-L`pwd`/prefix/lib"
```
