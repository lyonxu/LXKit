//
//  LXNavigationBar.m
//  LXKit
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

#import "LXNavigationBar.h"
#import "LXNavigationDefines.h"

@interface LXNavigationBar ()
@property (nonatomic, strong) UIView *lineView;
@end

@implementation LXNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = (CGRect){0, 0, [UIScreen mainScreen].bounds.size.width, kNavigationTotalHeight};
        self.backgroundColor = kNavigationBarColor;
        
        // separator line
        self.lineView = [[UIView alloc] initWithFrame:(CGRect){0, kNavigationTotalHeight, [UIScreen mainScreen].bounds.size.width, 0.5}];
        self.lineView.backgroundColor = kNavigationBarLineColor;
        [self addSubview:self.lineView];
    }
    return self;
}

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void)didReceiveThemeChangeNotification
{
    self.backgroundColor = kNavigationBarColor;
    self.lineView.backgroundColor = kNavigationBarLineColor;
}

#pragma mark - Getter & Setter

- (void)setNavBackgroundColor:(UIColor *)navBackgroundColor
{
    _navBackgroundColor = navBackgroundColor;
    if (navBackgroundColor) {
        self.backgroundColor = navBackgroundColor;
    } else {
        self.backgroundColor = navBackgroundColor;
    }
}

- (void)setIsBottomLineHidden:(BOOL)isBottomLineHidden
{
    _isBottomLineHidden = isBottomLineHidden;
    
    _lineView.hidden = isBottomLineHidden;
}

- (void)setBottomLineBackgroundColor:(UIColor *)bottomLineBackgroundColor
{
    _bottomLineBackgroundColor = bottomLineBackgroundColor;
    
    _lineView.backgroundColor = bottomLineBackgroundColor;
}

- (void)setNavBackgroundView:(UIView *)navBackgroundView
{
    _navBackgroundView = navBackgroundView;
    
    [_navBackgroundView removeFromSuperview];
    [self addSubview:_navBackgroundView];
    //send the background view to bottom
    [self sendSubviewToBack:_navBackgroundView];
    //send the separator line to up
    [self bringSubviewToFront:self.lineView];
}

#pragma mark - Private Methods

- (void)setViewHeight:(CGFloat)height view:(UIView *)view
{
    CGRect frame = view.frame;
    frame.size.height = height;
    view.frame = frame;
}

#pragma mark - Public Methods

- (void)setNavigationBarHeight:(CGFloat)height
{
    CGFloat totalHeight = height + kNavigationBarStatusBarHeight;
    
    [self setViewHeight:totalHeight view:self];
    [self setViewHeight:totalHeight view:self.navBackgroundView];
    
    CGRect frame = self.lineView.frame;
    frame.origin.y = totalHeight - frame.size.height;
    self.lineView.frame = frame;
}

@end
