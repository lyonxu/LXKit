//
//  LXSlideIndicator.m
//
//  Created by Lyon Xu on 2020/3/5.
//  Copyright © 2020 Lyon. All rights reserved.
//

#import "LXSlideIndicator.h"

@implementation LXSlideIndicatorConfig
- (instancetype)init
{
    if (self = [super init]) {
        self.width = 30;
        self.height = 4;
        self.backgroundColor = [UIColor lightGrayColor];
        self.slideViewColor = [UIColor blueColor];
    }
    return self;
}
@end


@interface LXSlideIndicator ()
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *slideView;
@end

@implementation LXSlideIndicator

- (instancetype)initWithConfig:(LXSlideIndicatorConfig *)config
{
    if (self = [super init]) {
        self.config = config;
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.frame = CGRectMake(0, 0, self.config.width, self.config.height);
    
    //背景视图
    _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.config.width, self.config.height)];
    _backgroundView.backgroundColor = self.config.backgroundColor;
    [self addSubview:_backgroundView];
    
    //滑块视图
    _slideView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [self calcSlideViewWidth], self.config.height)];
    _slideView.backgroundColor = self.config.slideViewColor;
    [self addSubview:_slideView];
}

#pragma mark - Private

/**
 计算滑块的宽度

 @return CGFloat
 */
- (CGFloat)calcSlideViewWidth
{
    CGFloat slideViewWidth;
    if (self.config.slideViewWidth <= 0) {
        //滑块使用默认宽度，设置为背景视图宽度的一半
        slideViewWidth = self.config.width * 0.5;
    } else {
        //滑块使用定义的宽度
        slideViewWidth = self.config.slideViewWidth;
    }
    return slideViewWidth;
}

/**
 滑块响应滑动事件

 @param contentOffset   关联scrollView的contentOffset
 @param contentWidth    关联scrollView的内容区域宽度
 @param scrollViewWidth 关联scrollView的实际宽度
 */
- (void)slideWithContentOffset:(CGFloat)contentOffset contentWidth:(CGFloat)contentWidth scrollViewWidth:(CGFloat)scrollViewWidth
{
    //关联scrollView的内容区域，左侧从0开始的x轴的可滚动区域范围
    CGFloat scrollAreaWidth = contentWidth - scrollViewWidth;
    //异常处理
    if (scrollAreaWidth == 0) {
        return;
    }
    //contentOffset从0到scrollAreaWidth，才响应滑动
    if (contentOffset < 0 || contentOffset > scrollAreaWidth) {
        return;
    }
    
    //滚动的比例
    CGFloat scale = contentOffset / scrollAreaWidth;
    
    //滑块的宽度
    CGFloat slideViewWidth = [self calcSlideViewWidth];
    CGFloat blankWidth = self.config.width - slideViewWidth;
    
    //根据比例，等比计算出滑块的位置
    CGFloat slideOffset = blankWidth * scale;
    
    //更新滑块的位置
    CGRect frame = _slideView.frame;
    frame.origin.x = slideOffset;
    _slideView.frame = frame;
}

#pragma mark - Public

- (void)scrollViewRelativeDidScroll:(UIScrollView *)scrollView
{
    [self slideWithContentOffset:scrollView.contentOffset.x contentWidth:scrollView.contentSize.width scrollViewWidth:scrollView.frame.size.width];
}

@end
