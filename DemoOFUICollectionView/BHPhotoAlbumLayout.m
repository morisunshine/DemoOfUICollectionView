//
//  BHPhotoAlbumLayout.m
//  DemoOFUICollectionView
//
//  Created by Sheldon on 13-10-24.
//  Copyright (c) 2013年 Sheldon. All rights reserved.
//

#import "BHPhotoAlbumLayout.h"

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

@end
