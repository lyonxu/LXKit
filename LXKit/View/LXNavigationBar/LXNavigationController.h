//
//  LXNavigationController.h
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


/**
 how to use :
 
 !!!
 Important
 !!!
 When you set the title or BarButtonItem, you must do it in these mothods :
 - (void)viewWillAppear:(BOOL)animated;
 or
 - (void)viewDidAppear:(BOOL)animated;
 
 As default,
 1. LXNavigationController's Navigation Bar has a left BarButtonItem with title of 'Back', used to pop ViewController.
 2. Has no title and right BarButtonItem.
 
 If you want to show the original Navigation Bar within UINavigationController, use this to init LXNavigationController :
 - (instancetype)initWithRootViewController:(UIViewController *)rootViewController hideOriginalBar:(BOOL)hideOriginalBar;
 Otherwise, call :
 - (instancetype)initWithRootViewController:(UIViewController *)rootViewController;
 
 */


#import <UIKit/UIKit.h>

@interface LXNavigationController : UINavigationController

/**
 init with RootViewController (default to hide the UINavigationController's navigationBar, just show the new custom LXNavigationController's bar)
 
 @param rootViewController      rootViewController
 @return LXNavigationController
 */
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController;

/**
 init with RootViewController, can show or hide the UINavigationController's navigationBar

 @param rootViewController      rootViewController
 @param hideOriginalBar         hide the UINavigationController's navigationBar
 @return LXNavigationController
 */
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController hideOriginalBar:(BOOL)hideOriginalBar;

@end
