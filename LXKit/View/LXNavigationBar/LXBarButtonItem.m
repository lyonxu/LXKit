//
//  LXBarButtonItem.m
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

#import "LXBarButtonItem.h"
#import "LXNavigationDefines.h"
#import "UIView+LXFrame.h"

@interface LXBarButtonItem ()
@property (nonatomic, strong) UIImage *buttonImage;
@property (nonatomic, strong) UILabel *badgeLabel;
@property (nonatomic, copy) void (^actionBlock)(id);
@end

@implementation LXBarButtonItem

- (instancetype)initWithTitle:(NSString *)title style:(LXBarButtonItemStyle)style handler:(void (^)(id sender))action {
    if (self = [super init]) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:title forState:UIControlStateNormal];
        [button.titleLabel setFont:kNavigationBarButtonItemFont];
        [button setTitleColor:kNavigationBarTintColor forState:UIControlStateNormal];
        [button sizeToFit];
        button.height = kNavigationBarHeight;
        button.width += 30;
        button.centerY = kNavigationBarStatusBarHeight + kNavigationBarHeight/2;
        button.x = 0;
        
        self.view = button;
        self.actionBlock = action;
        
        [button addTarget:self action:@selector(handleTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(handleTouchDown:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(handleTouchUp:) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpOutside|UIControlEventTouchDragOutside];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image style:(LXBarButtonItemStyle)style handler:(void (^)(id sender))action {
    
    if ([self init]) {
        self.buttonImage = image;
        
        UIButton *button = [[UIButton alloc] init];
        [button setImage:image forState:UIControlStateNormal];
        [button setImage:image forState:UIControlStateHighlighted];
        [button sizeToFit];
        button.height = kNavigationBarHeight;
        button.width += 30;
        button.centerY = kNavigationBarStatusBarHeight + kNavigationBarHeight/2;
        button.x = 0;
        
        [button sizeToFit];
        button.height = kNavigationBarHeight;
        button.width += 30;
        
        self.view = button;
        self.actionBlock = action;
        
        [button addTarget:self action:@selector(handleTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(handleTouchDown:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(handleTouchUp:) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpOutside|UIControlEventTouchDragOutside];
    }
    return self;
}

- (void)setEnabled:(BOOL)enabled {
    _enabled = enabled;
    if (enabled) {
        self.view.userInteractionEnabled = YES;
        self.view.alpha = 1.0;
    } else {
        self.view.userInteractionEnabled = NO;
        self.view.alpha = 0.3;
    }
}

- (void)setTitleColor:(UIColor *)color {
    [((UIButton *)self.view) setTitleColor:color forState:UIControlStateNormal];
}

- (void)setTitleFont:(UIFont *)font {
    ((UIButton *)self.view).titleLabel.font = font;
}

- (void)setHidden:(BOOL)hidden {
    ((UIButton *)self.view).hidden = hidden;
}

#pragma mark - Private Methods
- (void)handleTouchUpInside:(UIButton *)button {
    self.actionBlock(button);
    [UIView animateWithDuration:0.2 animations:^{
        button.alpha = 1.0;
    }];
}
- (void)handleTouchDown:(UIButton *)button {
    button.alpha = 0.3;
}
- (void)handleTouchUp:(UIButton *)button {
    [UIView animateWithDuration:0.3 animations:^{
        button.alpha = 1.0;
    }];
}
@end
