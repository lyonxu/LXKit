//
//  LXGradientView.h
//  LXViews
//
//  Created by 徐良华 on 2017/12/20.
//  Copyright © 2017年 Lyon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXGradientView : UIView

/**
 create gradient view from left to right
 
 @param colors      include two colors
 @return            a gradient UIView
 */
- (instancetype)initWithColors:(NSArray *)colors;

/**
 create gradient view
 
 @param colors      include two colors
 @param startPoint  start position
 @param endPoint    end position
 @return            a gradient UIView
 */
- (instancetype)initWithColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

#pragma mark - Public

/**
 update the color
 
 @param colors      include two colors
 */
- (void)updateGradientColors:(NSArray *)colors;

@end
