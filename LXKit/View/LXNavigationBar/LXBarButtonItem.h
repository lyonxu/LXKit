//
//  LXBarButtonItem.h
//  LXKit
//
//  Created by Lyon Xu on 2018/1/8.
//  Copyright © 2018 Lyon. All rights reserved.
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
 *  Source code on github : https://github.com/lyonxu/LXKit
 */

#import <UIKit/UIKit.h>

/**
 BarButtonItem style
 */
typedef NS_ENUM(NSUInteger, LXBarButtonItemStyle) {
    LXBarButtonItemStyleNone,
    LXBarButtonItemStylePlain,
    LXBarButtonItemStyleBordered,
};

@interface LXBarButtonItem : UIView

/**
 get the title view
 */
@property (nonatomic, strong, readwrite) UIView *view;

/**
 set the enabled of the title view
 */
@property (nonatomic, assign, getter = isEnabled) BOOL enabled;

/**
 init with title, style, and action

 @param title       title name
 @param style       LXBarButtonItemStyle
 @param action      target action
 @return LXBarButtonItem
 */
- (instancetype)initWithTitle:(NSString *)title style:(LXBarButtonItemStyle)style handler:(void (^)(id sender))action;

/**
 init with image, style, and action

 @param image       image of the BarButtonItem
 @param style       LXBarButtonItemStyle
 @param action      target action
 @return LXBarButtonItem
 */
- (instancetype)initWithImage:(UIImage *)image style:(LXBarButtonItemStyle)style handler:(void (^)(id sender))action;

/**
 set the tink color of title

 @param color UIColor
 */
- (void)setTitleColor:(UIColor *)color;
/**
 set the font of title

 @param font UIFont
 */
- (void)setTitleFont:(UIFont *)font;

/**
 whether to hide the BarButtonItem

 @param hidden      YES:hide, NO:show
 */
- (void)setHidden:(BOOL)hidden;

@end
