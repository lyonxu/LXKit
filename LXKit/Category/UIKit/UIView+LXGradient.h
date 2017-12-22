//
//  UIView+LXGradient.h
//  LXKit
//
//  Created by 徐良华 on 2017/12/21.
//  Copyright © 2017年 Lyon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LXGradient)

/* The array of CGColorRef objects defining the color of each gradient
 * stop. Defaults to nil. Animatable. */

@property(nullable, copy) NSArray *colors;

/* An optional array of NSNumber objects defining the location of each
 * gradient stop as a value in the range [0,1]. The values must be
 * monotonically increasing. If a nil array is given, the stops are
 * assumed to spread uniformly across the [0,1] range. When rendered,
 * the colors are mapped to the output colorspace before being
 * interpolated. Defaults to nil. Animatable. */

@property(nullable, copy) NSArray<NSNumber *> *locations;

/* The start and end points of the gradient when drawn into the layer's
 * coordinate space. The start point corresponds to the first gradient
 * stop, the end point to the last gradient stop. Both points are
 * defined in a unit coordinate space that is then mapped to the
 * layer's bounds rectangle when drawn. (I.e. [0,0] is the bottom-left
 * corner of the layer, [1,1] is the top-right corner.) The default values
 * are [.5,0] and [.5,1] respectively. Both are animatable. */

@property CGPoint startPoint;
@property CGPoint endPoint;

/**
 create a gradient UIView

 @param colors      The array of CGColorRef objects defining the color of each gradient stop
 @param locations   An optional array of NSNumber objects defining the location of each gradient stop as a value in the range [0,1]
 @param startPoint  start position
 @param endPoint    end position
 @return            a gradient UIView
 */
+ (UIView *_Nullable)gradientViewWithColors:(NSArray<UIColor *> *_Nullable)colors
                                  locations:(NSArray<NSNumber *> *_Nullable)locations
                                 startPoint:(CGPoint)startPoint
                                   endPoint:(CGPoint)endPoint;

/**
 set gradient background to this UIView
 
 @param colors      The array of CGColorRef objects defining the color of each gradient stop
 @param locations   An optional array of NSNumber objects defining the location of each gradient stop as a value in the range [0,1]
 @param startPoint  start position
 @param endPoint    end position
 */
- (void)setGradientBackgroundWithColors:(NSArray<UIColor *> *_Nullable)colors
                              locations:(NSArray<NSNumber *> *_Nullable)locations
                             startPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint;


/**
 create a gradient UIView, from left to right, with two color
 
 @param leftColor   left color at location [0,0]
 @param rightColor  right color at location [1,0]
 @return            a gradient UIView
 */
+ (UIView *_Nullable)gradientViewFromLeftColor:(UIColor *_Nullable)leftColor toRightColor:(UIColor *_Nullable)rightColor;

@end
