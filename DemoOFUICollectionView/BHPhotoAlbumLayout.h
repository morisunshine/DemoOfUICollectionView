//
//  BHPhotoAlbumLayout.h
//  DemoOFUICollectionView
//
//  Created by Sheldon on 13-10-24.
//  Copyright (c) 2013年 Sheldon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHPhotoAlbumLayout : UICollectionViewLayout

@property (nonatomic) UIEdgeInsets itemInsets;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) CGFloat interItemSpacingY;
@property (nonatomic) NSInteger numberOfColumns;

@end
