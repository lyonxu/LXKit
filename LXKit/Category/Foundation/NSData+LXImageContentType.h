//
//  NSData+LXImageContentType.h
//
//  Created by Lyon Xu on 2017/12/19.
//  Copyright © 2017 Lyon. All rights reserved.
//

// This code is distributed under the terms and conditions of the MIT license.

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

/**
 *  A category of NSData that can get the content type of an image.
 *
 *  Source code on github : https://github.com/lyonxu/LXKit
 */


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LXImageFormat) {
    LXImageFormatUndefined = -1,
    LXImageFormatJPEG = 0,
    LXImageFormatPNG,
    LXImageFormatGIF,
    LXImageFormatTIFF,
    LXImageFormatWebP,
    LXImageFormatHEIC,// the image saved on iOS 11
};

@interface NSData (LXImageContentType)

/**
 Get the image format

 @param data    the input data
 @return        the image format as `LXImageFormat` (enum)
 */
+ (LXImageFormat)lx_imageFormatForImageData:(nullable NSData *)data;

@end
