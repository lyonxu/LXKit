//
//  LXGradientView.m
//  LXViews
//
//  Created by 徐良华 on 2017/12/20.
//  Copyright © 2017年 Lyon. All rights reserved.
//

#import "LXGradientView.h"

@interface LXGradientView ()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@end

@implementation LXGradientView

- (instancetype)initWithColors:(NSArray *)colors
{
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(1, 0);
    if (self = [self initWithColors:colors startPoint:startPoint endPoint:endPoint]) {
        _colors = colors;
        _startPoint = startPoint;
        _endPoint = endPoint;
    }
    return self;
}

- (instancetype)initWithColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    if (self = [self init]) {
        _colors = colors;
        _startPoint = startPoint;
        _endPoint = endPoint;
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
        
        // default: white color, from left to right
        _colors = @[(id)[UIColor whiteColor].CGColor, (id)[UIColor whiteColor].CGColor];
        _startPoint = CGPointMake(0, 0);
        _endPoint = CGPointMake(1, 0);
        
        self.layer.masksToBounds = YES;
        [self.layer addSublayer:self.gradientLayer];
    }
    return self;
}

- (CAGradientLayer *)gradientLayer
{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
    }
    return _gradientLayer;
}

- (void)layoutSubviews
{
    [self updateGradientLayer];
}

- (void)updateGradientLayer
{
    _gradientLayer.bounds = self.bounds;
    _gradientLayer.frame = self.bounds;
    _gradientLayer.colors = _colors;
    _gradientLayer.startPoint = _startPoint;
    _gradientLayer.endPoint = _endPoint;
}

#pragma mark - Public

- (void)updateGradientColors:(NSArray *)colors
{
    _colors = colors;
    
    _gradientLayer.colors = _colors;
}

@end
