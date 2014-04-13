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


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
}

- (UICollectionViewScrollDirection)scrollDirection {
    
    return UICollectionViewScrollDirectionVertical;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    UICollectionView *collectionView = [self collectionView];
    UIEdgeInsets insets = [collectionView contentInset];
    CGPoint offset = [collectionView contentOffset];
    CGFloat minY = -insets.top;
    
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    NSLog(@"offset y is %f", offset.y);
    if (offset.y > 0) {
        
        CGSize  headerSize = [self headerReferenceSize];
        CGFloat deltaY = fabsf(offset.y - minY);
        
        for (UICollectionViewLayoutAttributes *attrs in attributes) {
            
            if ([attrs representedElementKind] == UICollectionElementKindSectionHeader) {
                
                NSLog(@"attr are %@", attrs);
                CGRect headerRect = [attrs frame];
                headerRect.size.height = headerSize.height - deltaY;//MAX(minY, headerSize.height + deltaY);
                headerRect.origin.y = headerRect.origin.y + deltaY;
                [attrs setFrame:headerRect];
                break;
            }
        }
    }
    
    
    return attributes;
}

@end