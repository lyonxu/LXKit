//
//  LXViewController.m
//  LXKitDemo
//
//  Created by 徐良华 on 2017/12/20.
//  Copyright © 2017年 Lyon. All rights reserved.
//

#import "LXViewController.h"
#import "LXKit.h"

@interface LXViewController ()

@end

@implementation LXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleLabel = [UILabel new];
    [titleLabel setTextColor:[UIColor blackColor]];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.text = @"LXGradientView";
    [titleLabel sizeToFit];
    titleLabel.left = 10;
    titleLabel.top = 100;
    [self.view addSubview:titleLabel];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)[UIColor redColor].CGColor, (id)[UIColor orangeColor].CGColor, nil];
    LXGradientView *gradientView = [[LXGradientView alloc] initWithColors:colors];
    gradientView.frame = CGRectMake(0, 0, 200, 44);
    gradientView.left = titleLabel.right + 10;
    gradientView.centerY = titleLabel.centerY;
    [self.view addSubview:gradientView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
