//
//  BHAlbumPhotoCell.m
//  DemoOFUICollectionView
//
//  Created by Sheldon on 13-10-24.
//  Copyright (c) 2013年 Sheldon. All rights reserved.
//

#import "BHAlbumPhotoCell.h"

@interface BHAlbumPhotoCell ()

@property (nonatomic, strong, readwrite) UIImageView *imageVIew;

@end

@implementation BHAlbumPhotoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1.0];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
