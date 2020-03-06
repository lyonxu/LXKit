//
//  LXIndicatorViewController.m
//  LXKitDemo
//
//  Created by xulh on 2020/3/5.
//  Copyright © 2020 Lyon. All rights reserved.
//

#import "LXIndicatorViewController.h"
#import "LXKit.h"

@interface LXIndicatorViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) LXSlideIndicator *slideIndicator;
@end

@implementation LXIndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [self initSlideIndicator];
}

- (void)initSlideIndicator {
    if (!self.slideIndicator) {
        self.collectionView.showsHorizontalScrollIndicator = NO;
        
        LXSlideIndicatorConfig *config = [LXSlideIndicatorConfig new];
//        config.width = 30;
//        config.height = 4;
//        config.backgroundColor = [UIColor grayColor];
//        config.slideViewColor = [UIColor blueColor];
        self.slideIndicator = [[LXSlideIndicator alloc] initWithConfig:config];
        self.slideIndicator.frame = CGRectMake(self.collectionView.frame.size.width/2-config.width/2, self.collectionView.frame.origin.y+self.collectionView.frame.size.height-config.height, config.width, config.height);
        [self.view addSubview:self.slideIndicator];
    }
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(120, 120);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 200);
        _collectionView.backgroundColor = [UIColor grayColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor brownColor];
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.collectionView) {
        [self.slideIndicator scrollViewRelativeDidScroll:scrollView];
    }
}

@end
