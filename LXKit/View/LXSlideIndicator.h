//
//  LXSlideIndicator.h
//
//  Created by Lyon Xu on 2020/3/5.
//  Copyright © 2020 Lyon. All rights reserved.
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
 *  Create a customized scroll bar while using a UIScrollView, like UICollectionView、UITableView etc.
 *  自定义滚动条
 *
 *  Source code on github : https://github.com/lyonxu/LXKit
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXSlideIndicatorConfig : NSObject

/**
 视图整体的宽度
 */
@property (nonatomic, assign) CGFloat width;
/**
 视图整体的高度
 */
@property (nonatomic, assign) CGFloat height;
/**
 背景颜色
 */
@property (nonatomic, strong) UIColor *backgroundColor;

/**
 滑块的颜色
 */
@property (nonatomic, strong) UIColor *slideViewColor;
/**
 滑块的宽度，默认为视图整体宽度width的一半
 */
@property (nonatomic, assign) CGFloat slideViewWidth;

@end

@interface LXSlideIndicator : UIView

/**
 视图的相关配置
 */
@property (nonatomic, strong) LXSlideIndicatorConfig *config;

/**
 初始化方法

 @param config 相关配置
 @return LXSlideIndicator实例
 */
- (instancetype)initWithConfig:(LXSlideIndicatorConfig *)config;

/**
 相关联的scrollView的滚动事件

 @param scrollView 相关联的scrollView对象
 */
- (void)scrollViewRelativeDidScroll:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
