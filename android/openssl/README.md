# Scripts for Cross-Compilation of OpenSSL for Android

## Files

* `Setenv-android.sh`: downloaded from [here](https://wiki.openssl.org/images/7/70/Setenv-android.sh), an explanation of usage is [here](https://wiki.openssl.org/index.php/Android).

## How to Compile and Install

Set a variable `ANDROID_NDK_ROOT` to the path of AndroidNDK (a directory containing `ndk-build`).
Then, execute:

```
$ . Setenv-android.sh
$ make
$ make install
```

The resulting binaries are installed into a directory `../prefix/`.
