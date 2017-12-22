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
    
    NSArray *colors = [NSArray arrayWithObjects:(id)[UIColor redColor].CGColor, (id)[UIColor orangeColor].CGColor, nil];
    LXGradientView *gradientView = [[LXGradientView alloc] initWithColors:colors];
    gradientView.frame = CGRectMake(50, 100, 200, 44);
    [self.view addSubview:gradientView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
