//
//  LXTestNavigationBarVC.m
//  LXKitDemo
//
//  Created by 徐良华 on 2018/3/14.
//  Copyright © 2018年 Lyon. All rights reserved.
//

#import "LXTestNavigationBarVC.h"
#import "LXKit.h"
#import "LXShowingNavBarViewController.h"

@interface LXTestNavigationBarVC ()

@end

@implementation LXTestNavigationBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *showNavBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [showNavBarButton setTitle:@"present a custom Navigation Bar" forState:UIControlStateNormal];
    [showNavBarButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [showNavBarButton sizeToFit];
    showNavBarButton.width += 10;
    showNavBarButton.x = 20;
    showNavBarButton.y = 100;
    showNavBarButton.layer.borderWidth = 1;
    showNavBarButton.layer.borderColor = [UIColor blackColor].CGColor;
    [showNavBarButton addTarget:self action:@selector(showNavBar) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showNavBarButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showNavBar
{
    LXShowingNavBarViewController *rootVC = [LXShowingNavBarViewController new];
    LXNavigationController *lxNavController = [[LXNavigationController alloc] initWithRootViewController:rootVC];
    [self presentViewController:lxNavController animated:YES completion:nil];
}

@end
