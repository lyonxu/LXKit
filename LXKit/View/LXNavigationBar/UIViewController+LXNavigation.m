//
//  UIViewController+LXNavigation.m
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

#import "UIViewController+LXNavigation.h"
#import <objc/runtime.h>
#import "LXNavigationDefines.h"
#import "LXBarButtonItem.h"
#import "UIView+LXFrame.h"

static char const * const kNaviHidden = "kLXNaviHidden";
static char const * const kNaviBar = "kLXNaviBar";
static char const * const kNaviBarView = "kLXNaviBarView";

@implementation UIViewController (LXNavigation)

@dynamic lx_navigationItem;
@dynamic lx_navigationBar;
@dynamic lx_navigationBarHidden;

- (void)setLx_navigationBarHidden:(BOOL)lx_navigationBarHidden {
    objc_setAssociatedObject(self, kNaviHidden, @(lx_navigationBarHidden), OBJC_ASSOCIATION_ASSIGN);
}

- (void)lx_setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
    CGFloat duration = animated ? 0.3f : 0.f;
    
    if (hidden) {
        [UIView animateWithDuration:duration animations:^{
            self.lx_navigationBar.y = -kNavigationTotalHeight;
            for (UIView *view in self.lx_navigationBar.subviews) {
                view.alpha = 0.0;
            }
        } completion:^(BOOL finished) {
            self.lx_navigationBarHidden = YES;
        }];
    } else {
        [UIView animateWithDuration:duration animations:^{
            self.lx_navigationBar.y = 0;
            for (UIView *view in self.lx_navigationBar.subviews) {
                view.alpha = 1.0;
            }
        } completion:^(BOOL finished) {
            self.lx_navigationBarHidden = NO;
        }];
    }
}


- (LXNavigationBar *)lx_navigationBar {
    return objc_getAssociatedObject(self, kNaviBarView);
}

- (void)setLx_navigationBar:(LXNavigationBar *)lx_navigationBar {
    objc_setAssociatedObject(self, kNaviBarView, lx_navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (LXNavigationItem *)lx_navigationItem {
    return objc_getAssociatedObject(self, kNaviBar);
}

- (void)setLx_navigationItem:(LXNavigationItem *)lx_navigationItem {
    objc_setAssociatedObject(self, kNaviBar, lx_navigationItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 设置导航栏的高度
 
 @param height 高度
 */
- (void)lx_setNavigationBarHeight:(CGFloat)height
{
    [self.lx_navigationBar setNavigationBarHeight:height];
    
    CGFloat centerY = height/2 + kNavigationBarStatusBarHeight;
    
    UIButton *leftButton = (UIButton *)self.lx_navigationItem.leftBarButtonItem.view;
    leftButton.centerY = centerY;
    
    UIButton *rightButton = (UIButton *)self.lx_navigationItem.rightBarButtonItem.view;
    rightButton.centerY = centerY;
    
    self.lx_navigationItem.titleLabel.centerY = centerY;
}

@end
