//
//  NSData+LXImageContentType.h
//  LXCategory
//
//  Created by Lyon.Xu on 2017/12/19.
//  Copyright © 2017年 Lyon. All rights reserved.
//

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
