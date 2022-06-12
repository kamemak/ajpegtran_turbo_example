## Overview

Functions called from Android are contained in [`app/src/main/cpp/libjpeg-turbo-2.1.3/ajpegtran_turbo.c`](app/src/main/cpp/libjpeg-turbo-2.1.3/ajpegtran_turbo.c).
This sample library provide the follwoing two functions.

- ajpegtranhead()  
Get properties about specified JPEG file.

- ajpegtran()  
Main function execute lossless JPEG operations.


## ajpegtranhead()
By calling this function, the JPEG property can be get.

`ajpegtranhead( JNIEnv* env,
                                         jobject thiz,
                                         jint fd,
                                         jintArray jParamArray
                                                  )`

### Argument
- jint fd  
File descripor to read JPEG file.
- jintArray jParamArray  
Integer array of size 10 to return parameters.

|Index|Value|
|:-:|:-|
|0|Image width (pixel)|
|1|Image height (pixel)|
|2|Color component number (1,3,4)|
|3|MCU width (block)|
|4|MCU height (block)|
|5|Color space (Value is defined in jpeglib.h line 220)|
|6|Quantization value for DC of component 0|
|7|Quantization value for DC of component 1|
|8|Quantization value for DC of component 2|
|9|Quantization value for DC of component 3|


### Return value
This function returns the following string.
- "OK"  
Successed.
- Another  
Error message.

### Note
The sample application call this function before ajpegtran() always.
But you can call ajpegtran() directly.

The quantization value is useful for option 'offset' about ajpegtran().
Refer explanation of option, 'offset'.

## ajpegtran()
This function execute lossless operation on JPEG image.

`ajpegtran( JNIEnv* env,
                                         jobject thiz,
                                         jint rfd,
                                         jint wfd,
                                         jstring jOptions
                                                  )`

### Argument
- jint rfd  
File descripor to read JPEG file.
- jint wfd  
File descripor to write JPEG file.
- jstring jOptions  
This string is for specifing option like command line below.  
`-optimize -copy all -crop 640x480+0+0`

### Return value
This function returns the following string.
- "OK"  
Successed.
- Another  
Error message.

### Available existing options
The following option can be used.
- copy [all|default|none]
- grayscale
- optimize
- crop
- flip [horizontal|vertical] 
- roate [90|180|270] 
- wipe
- restart

The following options can be used maybe.
- trim
- perfect
- transpose
- transverse
- maxmemory

Refer to IJG document about detail of the options.
