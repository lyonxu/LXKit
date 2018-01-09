//
//  LXCollectionViewLeftOrRightAlignedLayout.m
//
//  Created by Lyon Xu on 2018/1/8.
//  Copyright © 2018 Lyon. All rights reserved.
//

#import "LXCollectionViewLeftOrRightAlignedLayout.h"
#import <objc/runtime.h>

@interface UICollectionViewLayoutAttributes (LeftOrRightAligned)

- (void)leftAlignFrameWithSectionInset:(UIEdgeInsets)sectionInset;
- (void)rightAlignFrameWithSectionInset:(UIEdgeInsets)sectionInset collectionViewWidth:(CGFloat)collectionViewWidth;

@end

@implementation UICollectionViewLayoutAttributes (LeftOrRightAligned)

- (void)leftAlignFrameWithSectionInset:(UIEdgeInsets)sectionInset
{
    CGRect frame = self.frame;
    frame.origin.x = sectionInset.left;
    self.frame = frame;
}
- (void)rightAlignFrameWithSectionInset:(UIEdgeInsets)sectionInset collectionViewWidth:(CGFloat)collectionViewWidth
{
    CGRect frame = self.frame;
    frame.origin.x = collectionViewWidth - sectionInset.right - self.frame.size.width;
    self.frame = frame;
}

@end

#pragma mark -

@implementation LXCollectionViewLeftOrRightAlignedLayout

#pragma mark - Getter & Setter

- (BOOL)rightAligned {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRightAligned:(BOOL)rightAligned {
    objc_setAssociatedObject(self, @selector(rightAligned), @(rightAligned), OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - UICollectionViewLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *originalAttributes = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *updatedAttributes = [NSMutableArray arrayWithArray:originalAttributes];
    
    if (self.rightAligned) {
        // right aligned
        for (NSInteger index = originalAttributes.count - 1; index >= 0; index--) {
            UICollectionViewLayoutAttributes * attributes = originalAttributes[index];
            if (!attributes.representedElementKind) {
                NSUInteger index = [updatedAttributes indexOfObject:attributes];
                updatedAttributes[index] = [self layoutAttributesForItemRightAlignedAtIndexPath:attributes.indexPath itemCount:originalAttributes.count];
            }
        }
    } else {
        // left aligned
        for (UICollectionViewLayoutAttributes *attributes in originalAttributes) {
            if (!attributes.representedElementKind) {
                NSUInteger index = [updatedAttributes indexOfObject:attributes];
                updatedAttributes[index] = [self layoutAttributesForItemAtIndexPath:attributes.indexPath];
            }
        }
    }
    
    return updatedAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemRightAlignedAtIndexPath:(NSIndexPath *)indexPath itemCount:(NSInteger)itemCount
{
    UICollectionViewLayoutAttributes* currentItemAttributes = [[super layoutAttributesForItemAtIndexPath:indexPath] copy];
    UIEdgeInsets sectionInset = [self evaluatedSectionInsetForItemAtIndex:indexPath.section];
    
    BOOL isLastItemInSection = indexPath.item == itemCount - 1;
    if (isLastItemInSection) {
        [currentItemAttributes rightAlignFrameWithSectionInset:sectionInset collectionViewWidth:self.collectionView.frame.size.width];
        return currentItemAttributes;
    }
    
    // the total width without left inset and right inset
    CGFloat layoutWidth = CGRectGetWidth(self.collectionView.frame) - sectionInset.left - sectionInset.right;
    
    // reversed cycle
    NSIndexPath* previousIndexPath = [NSIndexPath indexPathForItem:indexPath.item+1 inSection:indexPath.section];
    CGRect previousFrame = [self layoutAttributesForItemRightAlignedAtIndexPath:previousIndexPath itemCount:itemCount].frame;
    CGFloat previousFrameLeftPoint = previousFrame.origin.x;
    CGRect currentFrame = currentItemAttributes.frame;
    CGRect strecthedCurrentFrame = CGRectMake(sectionInset.left,
                                              currentFrame.origin.y,
                                              layoutWidth,
                                              currentFrame.size.height);
    // if the current frame, once left aligned to the left and stretched to the full collection view
    // widht intersects the previous frame then they are on the same line
    BOOL isLastItemInRow = !CGRectIntersectsRect(previousFrame, strecthedCurrentFrame);

    if (isLastItemInRow) {
        // make sure the last item on a line is right aligned
        [currentItemAttributes rightAlignFrameWithSectionInset:self.sectionInset collectionViewWidth:self.collectionView.frame.size.width];
        return currentItemAttributes;
    }
    
    // reset the frame of current item
    CGRect frame = currentItemAttributes.frame;
    frame.origin.x = previousFrameLeftPoint - [self evaluatedMinimumInteritemSpacingForSectionAtIndex:indexPath.section] - frame.size.width;
    currentItemAttributes.frame = frame;
    
    return currentItemAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes* currentItemAttributes = [[super layoutAttributesForItemAtIndexPath:indexPath] copy];
    UIEdgeInsets sectionInset = [self evaluatedSectionInsetForItemAtIndex:indexPath.section];
    
    BOOL isFirstItemInSection = indexPath.item == 0;
    CGFloat layoutWidth = CGRectGetWidth(self.collectionView.frame) - sectionInset.left - sectionInset.right;
    
    if (isFirstItemInSection) {
        [currentItemAttributes leftAlignFrameWithSectionInset:sectionInset];
        return currentItemAttributes;
    }
    
    NSIndexPath* previousIndexPath = [NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section];
    CGRect previousFrame = [self layoutAttributesForItemAtIndexPath:previousIndexPath].frame;
    CGFloat previousFrameRightPoint = previousFrame.origin.x + previousFrame.size.width;
    CGRect currentFrame = currentItemAttributes.frame;
    CGRect strecthedCurrentFrame = CGRectMake(sectionInset.left,
                                              currentFrame.origin.y,
                                              layoutWidth,
                                              currentFrame.size.height);
    // if the current frame, once left aligned to the left and stretched to the full collection view
    // widht intersects the previous frame then they are on the same line
    BOOL isFirstItemInRow = !CGRectIntersectsRect(previousFrame, strecthedCurrentFrame);
    
    if (isFirstItemInRow) {
        // make sure the first item on a line is left aligned
        [currentItemAttributes leftAlignFrameWithSectionInset:sectionInset];
        return currentItemAttributes;
    }
    
    CGRect frame = currentItemAttributes.frame;
    frame.origin.x = previousFrameRightPoint + [self evaluatedMinimumInteritemSpacingForSectionAtIndex:indexPath.section];
    currentItemAttributes.frame = frame;

    return currentItemAttributes;
}

- (CGFloat)evaluatedMinimumInteritemSpacingForSectionAtIndex:(NSInteger)sectionIndex
{
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        id<LXCollectionViewDelegateLeftOrRightAlignedLayout> delegate = (id<LXCollectionViewDelegateLeftOrRightAlignedLayout>)self.collectionView.delegate;
        
        return [delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:sectionIndex];
    } else {
        return self.minimumInteritemSpacing;
    }
}

- (UIEdgeInsets)evaluatedSectionInsetForItemAtIndex:(NSInteger)index
{
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        id<LXCollectionViewDelegateLeftOrRightAlignedLayout> delegate = (id<LXCollectionViewDelegateLeftOrRightAlignedLayout>)self.collectionView.delegate;
        
        return [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:index];
    } else {
        return self.sectionInset;
    }
}

@end
