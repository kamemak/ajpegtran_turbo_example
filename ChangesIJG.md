## Overview
This document describes changing the libjpeg-turbo code.
The libjpeg-turbo code is in the following folder.  
[`app/src/main/cpp/libjpeg-turbo-2.1.3`](app/src/main/cpp/libjpeg-turbo-2.1.3)  
Base version of the libjpeg-turbo code is **2.1.3**. 

The changes were made from the following three points.
- Remove unused functions and files.
- Modify interfaces for Android.

Almost modified parts are commented with keyword `ajpegtran`.
Execute `grep` to check.


## Remove unused
### Remove unused files
The following files are removed.
- makefile, cofig files and project files for another systems  

## Modify interfaces for Android.
### Add entry function for Android.
Added [`ajpegtran_turbo.c`](app/src/main/cpp/libjpeg-turbo-2.1.3/ajpegtran_turbo.c) based on `jpegtran.c`, a command line interface.
This file contains functions can be called from Android.

### Add .mk file
Added [`Android.mk`](app/src/main/cpp/Android.mk), a kind of makefile for th native build environment, ndkBuild.

### Modify error interface
In the original implementation, when an error occurs, exit() function is called and program terminates.
This implementation uses the longjmp() and setjmp() APIs.
When an error occurs, longjmp() is called, and back to root function which called setjmp().
And error message is set to global variable.
Refer ajpegtran_error_exit() in [`ajpegtran_turbo.c`](app/src/main/cpp/libjpeg-turbo-2.1.3/ajpegtran_turbo.c) to check implementation.

### Modify file I/O interface
In the original implementation, file pathes are pathed to interface function and access with fopen(), fread() and fwrite() functions.
Ih this implementation, file descriptors are pathed, and access with read() and write() functions.
Because in Android system, user application can't obtain the file path.
Refer the following codes to check.
- [`jdatadst.c`](app/src/main/cpp/libjpeg-turbo-2.1.3/jdatadst.c)  
- [`jdatasrc.c`](app/src/main/cpp/libjpeg-turbo-2.1.3/jdatasrc.c)  
- [`ajpegtran_turbo.c`](app/src/main/cpp/libjpeg-turbo-2.1.3/ajpegtran_turbo.c)  
