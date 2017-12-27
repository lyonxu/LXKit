//
//  NSString+LXLength.m
//  LXKit
//
//  Created by 徐良华 on 2017/12/25.
//  Copyright © 2017年 Lyon. All rights reserved.
//

#import "NSString+LXLength.h"

@implementation NSString (LXLength)

- (NSUInteger)charactorNumber
{
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    return [self charactorNumberWithEncoding:encoding];
}

- (NSUInteger)charactorNumberWithEncoding:(NSStringEncoding)encoding
{
    NSUInteger strLength = 0;
    char *p = (char *)[self cStringUsingEncoding:encoding];
    
    NSUInteger lengthOfBytes = [self lengthOfBytesUsingEncoding:encoding];
    for (int i = 0; i < lengthOfBytes; i++) {
        if (*p) {
            p++;
            strLength++;
        }
        else {
            p++;
        }
    }
    return strLength;
}

- (NSUInteger)charactorNumberForChineseSpecial
{
    NSUInteger strLength = 0;
    for(int i = 0; i < [self length]; i++) {
        int a = [self characterAtIndex:i];
        if (a >= 0x4e00 && a <= 0x9fa5) { // judging whether it is Chinese
            strLength += 2;
        } else {
            strLength += 1;
        }
    }
    return strLength;
}

@end

