//
//  IKWStickyHeaderLayout.m
//  WeatherApp
//
//  Created by ilteris on 4/12/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWStickyHeaderLayout.h"
#import "IKWCurrentHeader.h"

@implementation IKWStickyHeaderLayout


-(id)init {
    if (!(self = [super init])) return nil;
    
    NSLog(@"IKWStickyHeaderLayout init");
    self.sectionInset = UIEdgeInsetsMake(100, 10, 10, 10);
    
  //  self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
   // self.visibleIndexPathsSet = [NSMutableSet set];
    
    return self;
}



- (NSArray *) layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *answer = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    NSMutableIndexSet *missingSections = [NSMutableIndexSet indexSet];
    for (NSUInteger idx=0; idx<[answer count]; idx++) {
        UICollectionViewLayoutAttributes *layoutAttributes = answer[idx];
        
        if (layoutAttributes.representedElementCategory == UICollectionElementCategoryCell) {
            [missingSections addIndex:layoutAttributes.indexPath.section];  // remember that we need to layout header for this section
        }
        if ([layoutAttributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            [answer removeObjectAtIndex:idx];  // remove layout of header done by our super, we will do it right later
            idx--;
        }
    }
    
    // layout all headers needed for the rect using self code
    [missingSections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:idx];
        UICollectionViewLayoutAttributes *layoutAttributes = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        if (layoutAttributes != nil) {
            [answer addObject:layoutAttributes];
        }
    }];
    
    return answer;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForSupplementaryViewOfKind:kind atIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionView * const cv = self.collectionView;
        CGPoint const contentOffset = cv.contentOffset;
        CGPoint nextHeaderOrigin = CGPointMake(INFINITY, INFINITY);
        
        NSLog(@"attributes are %@", attributes);
        /*
        IKWCurrentHeader *aheaderView = [cv dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
         */
        NSLog(@"header view is %li", (long)indexPath.row);
        NSLog(@"header kind is %@", kind);
        NSLog(@"collectionview is  %@", self.collectionView);
        
        if (indexPath.section+1 < [cv numberOfSections]) {
            UICollectionViewLayoutAttributes *nextHeaderAttributes = [super layoutAttributesForSupplementaryViewOfKind:kind atIndexPath:[NSIndexPath indexPathForItem:0 inSection:indexPath.section+1]];
            
            
            nextHeaderOrigin = nextHeaderAttributes.frame.origin;
            
        }
        
        CGRect frame = attributes.frame;
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
         //   frame.origin.y = MIN(MAX(contentOffset.y, frame.origin.y), nextHeaderOrigin.y - CGRectGetHeight(frame));
           // attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
        }
        else { // UICollectionViewScrollDirectionHorizontal
            frame.origin.x = MIN(MAX(contentOffset.x, frame.origin.x), nextHeaderOrigin.x - CGRectGetWidth(frame));
        }
        attributes.zIndex = 1024;
        attributes.frame = frame;
    }
    return attributes;
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForSupplementaryViewOfKind:kind atIndexPath:indexPath];
    return attributes;
}
- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForSupplementaryViewOfKind:kind atIndexPath:indexPath];
    return attributes;
}

- (BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBound {
    return YES;
}

@end