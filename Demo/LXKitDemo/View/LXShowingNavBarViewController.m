//
//  LXShowingNavBarViewController.m
//  LXKitDemo
//
//  Created by 徐良华 on 2018/3/14.
//  Copyright © 2018年 Lyon. All rights reserved.
//

#import "LXShowingNavBarViewController.h"
#import "LXKit.h"

@interface LXShowingNavBarViewController ()

@end

@implementation LXShowingNavBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *showNavBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [showNavBarButton setTitle:@"push new view controller" forState:UIControlStateNormal];
    [showNavBarButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [showNavBarButton sizeToFit];
    showNavBarButton.width += 10;
    showNavBarButton.x = 20;
    showNavBarButton.y = 100;
    showNavBarButton.layer.borderWidth = 1;
    showNavBarButton.layer.borderColor = [UIColor blackColor].CGColor;
    [showNavBarButton addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showNavBarButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.lx_navigationItem.title = @"I am title";
    
    self.lx_navigationItem.leftBarButtonItem = [[LXBarButtonItem alloc] initWithTitle:@"Close" style:LXBarButtonItemStylePlain handler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushVC
{
    [self.navigationController pushViewController:[UIViewController new] animated:YES];
}

@end
