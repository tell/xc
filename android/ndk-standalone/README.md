# Standalone Cross-Compile Toolchain of AndroidNDK

## Files

* `config.mk`: A configuration file for the installation of standalone cross-compile toolchain.
* `toolchain`: A directory containing the generated standalone cross-compile toolchain.

## How to Setup

1. Edit `config.mk` to set three variables `ANDROID_NDK_ROOT`, `ANDROID_PLATFORM`, and `ANDROID_TOOLCHAIN` to the path of AndroidNDK (a directory containing `ndk-build`), a directory name of supported platform, and a directory name of supported toolchain, respectively.

2. Then, execute:

```
$ make
```

3. In order to set environment variables, execute:

```
$ . setenv.sh
```
