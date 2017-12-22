//
//  NSData+LXImageContentType.m
//  LXCategory
//
//  Created by Lyon.Xu on 2017/12/19.
//  Copyright © 2017年 Lyon. All rights reserved.
//

#import "NSData+LXImageContentType.h"

@implementation NSData (LXImageContentType)

+ (LXImageFormat)lx_imageFormatForImageData:(nullable NSData *)data
{
    if (!data) {
        return LXImageFormatUndefined;
    }
    
    // File signatures table : http://www.garykessler.net/library/file_sigs.html
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return LXImageFormatJPEG;
        case 0x89:
            return LXImageFormatPNG;
        case 0x47:
            return LXImageFormatGIF;
        case 0x49:
        case 0x4D:
            return LXImageFormatTIFF;
        case 0x52: {
            if (data.length >= 12) {
                //RIFF....WEBP
                NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
                if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                    return LXImageFormatWebP;
                }
            }
            break;
        }
        case 0x00: {
            if (data.length >= 12) {
                //....ftypheic ....ftypheix ....ftyphevc ....ftyphevx
                NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(4, 8)] encoding:NSASCIIStringEncoding];
                if ([testString isEqualToString:@"ftypheic"]
                    || [testString isEqualToString:@"ftypheix"]
                    || [testString isEqualToString:@"ftyphevc"]
                    || [testString isEqualToString:@"ftyphevx"]) {
                    return LXImageFormatHEIC;
                }
            }
            break;
        }
    }
    return LXImageFormatUndefined;
}

@end
