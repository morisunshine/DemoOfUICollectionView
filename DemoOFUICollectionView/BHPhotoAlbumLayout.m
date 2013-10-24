//
//  BHPhotoAlbumLayout.m
//  DemoOFUICollectionView
//
//  Created by Sheldon on 13-10-24.
//  Copyright (c) 2013年 Sheldon. All rights reserved.
//

#import "BHPhotoAlbumLayout.h"

static NSString *const BHPhotoAlbumLayoutPhotoCellKind = @"PhotoCell";

@interface BHPhotoAlbumLayout ()

@property (nonatomic, strong) NSDictionary *layoutInfo;

@end

@implementation BHPhotoAlbumLayout

#pragma mark - Lifecycle -

- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self.itemInsets = UIEdgeInsetsMake(22, 22, 13, 22);
    self.itemSize = CGSizeMake(125, 125);
    self.interItemSpacingY = 12;
    self.numberOfColumns = 2;
}

#pragma mark - Layout - 

- (void)prepareLayout
{
    NSMutableDictionary *newLayoutInfo = [NSMutableDictionary dictionary];
    NSMutableDictionary *cellLayoutInfo = [NSMutableDictionary dictionary];
    
    NSInteger sectionCount = [self.collectionView numberOfSections];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    
    for (NSInteger section = 0; section < sectionCount; section++) {
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];
        
        for (NSInteger item = 0; item < itemCount; item++) {
            indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            
            UICollectionViewLayoutAttributes *itemAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            itemAttributes.frame = [self frameForAlbumPhotoAtIndexPath:indexPath];
            cellLayoutInfo[indexPath] = itemAttributes;
        }
    }
    
    newLayoutInfo[BHPhotoAlbumLayoutPhotoCellKind] = cellLayoutInfo;
    
    self.layoutInfo = newLayoutInfo;
}


#pragma mark - Private

- (CGRect)frameForAlbumPhotoAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.section / self.numberOfColumns;
    NSInteger column = indexPath.section % self.numberOfColumns;
    
    CGFloat spacingX = self.collectionView.bounds.size.width -
                       self.itemInsets.left -
                       self.itemInsets.right -
                       (self.numberOfColumns * self.itemSize.width);
    if (self.numberOfColumns > 1) {
        spacingX = spacingX / (self.numberOfColumns - 1);
    }
    
    CGFloat originX = floorf(self.itemInsets.left + (self.itemSize.width + spacingX) * column);
    CGFloat originY = floorf(self.itemInsets.top + (self.itemSize.height + self.interItemSpacingY) * row);
    
    return CGRectMake(originX, originY, self.itemSize.width, self.itemSize.height);
}

@end
