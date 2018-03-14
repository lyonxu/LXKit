//
//  LXNavigationController.m
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

#import "LXNavigationController.h"
#import "LXNavigationBar.h"
#import "LXNavigationItem.h"
#import "LXBarButtonItem.h"
#import "UIViewController+LXNavigation.h"

@interface LXNavigationController ()

@end

@implementation LXNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    return [self initWithRootViewController:rootViewController hideOriginalBar:YES];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController hideOriginalBar:(BOOL)hideOriginalBar;
{
    if (self = [super initWithRootViewController:rootViewController]) {
        self.navigationBar.hidden = hideOriginalBar;
    }
    return self;
}

#pragma mark - Push & Pop

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self configureNavBarForViewController:viewController];
    [super pushViewController:viewController animated:animated];
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return  [super popViewControllerAnimated:YES];
}

#pragma mark - Private

- (void)configureNavBarForViewController:(UIViewController *)viewController
{
    /*
     !!! cannot change the order of init
     */
    
    // 1. need to init lx_navigationBar firstly
    if (!viewController.lx_navigationBar) {
        viewController.lx_navigationBar = [[LXNavigationBar alloc] init];
        [viewController.view addSubview:viewController.lx_navigationBar];
    }
    
    // 2. and then add default leftBarButtonItem with 'Back' title
    if (!viewController.lx_navigationItem) {
        LXNavigationItem *navigationItem = [[LXNavigationItem alloc] init];
        // 2.1 need to set '_lx_viewController' firstly
        [navigationItem setValue:viewController forKey:@"_lx_viewController"];
        // 2.2 and then add leftBarButtonItem
        LXBarButtonItem *leftBarButtonItem = [[LXBarButtonItem alloc] initWithTitle:@"Back" style:LXBarButtonItemStylePlain handler:^(id sender) {
            [self popViewControllerAnimated:YES];
        }];
        [leftBarButtonItem setTitleColor:[UIColor colorWithRed:41/255.0 green:140/255.0 blue:251/255.0 alpha:1]];
        navigationItem.leftBarButtonItem = leftBarButtonItem;
        viewController.lx_navigationItem = navigationItem;
    }
}

@end
