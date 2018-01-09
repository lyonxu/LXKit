//
//  LXCollectionViewLeftOrRightAlignedLayout.h
//  LXKit
//
//  Created by Lyon.Xu on 2018/1/8.
//  Copyright © 2018年 Lyon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXCollectionViewLeftOrRightAlignedLayout : UICollectionViewFlowLayout

/**
 设置左对齐还是右对齐，默认左对齐
 */
@property (nonatomic, assign) BOOL rightAligned;

@end

@protocol LXCollectionViewDelegateLeftOrRightAlignedLayout <UICollectionViewDelegateFlowLayout>

@end
