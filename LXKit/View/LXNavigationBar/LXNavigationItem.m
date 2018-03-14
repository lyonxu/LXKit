//
//  LXNavigationItem.m
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

#import "LXNavigationItem.h"
#import "LXBarButtonItem.h"
#import "LXNavigationDefines.h"
#import "UIViewController+LXNavigation.h"
#import "UIView+LXFrame.h"

@interface LXNavigationItem ()
@property (nonatomic, weak) UIViewController *_lx_viewController;
@end

@implementation LXNavigationItem

- (void)setTitle:(NSString *)title {
    _title = title;
    if (!title) {
        _titleLabel.text = @"";
        return;
    }
    if ([title isEqualToString:_titleLabel.text]) {
        return;
    }
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:kNavigationBarTitleFont];
         [_titleLabel setTextColor:kNavigationBarTintColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [__lx_viewController.lx_navigationBar addSubview:_titleLabel];
    }
    _titleLabel.text = title;
    [_titleLabel sizeToFit];
    NSUInteger otherButtonWidth = self.leftBarButtonItem.view.width + self.rightBarButtonItem.view.width;
    _titleLabel.width = [UIScreen mainScreen].bounds.size.width - otherButtonWidth - 20;
    _titleLabel.centerY = kNavigationBarStatusBarHeight + kNavigationBarHeight/2;
    _titleLabel.centerX = [UIScreen mainScreen].bounds.size.width/2;
}

- (void)setTitleColor:(UIColor *)color {
    _titleLabel.textColor = color;
}

- (void)setLeftBarButtonItem:(LXBarButtonItem *)leftBarButtonItem {
    if (__lx_viewController) {
        [_leftBarButtonItem.view removeFromSuperview];
        leftBarButtonItem.view.x = 0;
        leftBarButtonItem.view.centerY = kNavigationBarStatusBarHeight + kNavigationBarHeight/2;
        [__lx_viewController.lx_navigationBar addSubview:leftBarButtonItem.view];
    }
    _leftBarButtonItem = leftBarButtonItem;
}

- (void)setRightBarButtonItem:(LXBarButtonItem *)rightBarButtonItem {
    if (__lx_viewController) {
        [_rightBarButtonItem.view removeFromSuperview];
        rightBarButtonItem.view.x = [UIScreen mainScreen].bounds.size.width - rightBarButtonItem.view.width;
        rightBarButtonItem.view.centerY = kNavigationBarStatusBarHeight + kNavigationBarHeight/2;
        [__lx_viewController.lx_navigationBar addSubview:rightBarButtonItem.view];
    }
    _rightBarButtonItem = rightBarButtonItem;
}

@end
