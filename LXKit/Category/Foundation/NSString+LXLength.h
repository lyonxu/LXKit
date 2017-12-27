//
//  NSString+LXLength.h
//  LXKit
//
//  Created by 徐良华 on 2017/12/25.
//  Copyright © 2017年 Lyon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LXLength)

/**
 calulate the number of charactor.
 1 Chinese(including Chinese mark) = 2
 1 English or number = 1
 1 emoji = 4

 @return NSUInteger
 */
- (NSUInteger)charactorNumber;

/**
 calulate the number of charactor with designated NSStringEncoding.

 @param encoding NSStringEncoding
 @return NSUInteger
 */
- (NSUInteger)charactorNumberWithEncoding:(NSStringEncoding)encoding;

/**
 calulate the number of charactor.
 1 Chinese(not including Chinese mark) = 2
 1 other charactor = 1

 @return NSUInteger
 */
- (NSUInteger)charactorNumberForChineseSpecial;

@end
