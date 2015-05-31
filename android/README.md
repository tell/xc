# Cross-Compilations for Android

## Directories

* `ndk-standalone`
* `openssl`
* `gmp`
* `prefix`: cross-compiled binaries are installed into this directory.

## How to Use

Suppose that `ndk-standalone`, `openssl`, and `gmp` are built and installed.

```
$ cd ndk-standalone
$ . setenv.sh
$ cd ..
$ export LDFLAGS="-L`pwd`/prefix/lib"
```
