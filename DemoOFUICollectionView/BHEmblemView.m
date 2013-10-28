//
//  BHEmblemView.m
//  DemoOFUICollectionView
//
//  Created by Sheldon on 13-10-28.
//  Copyright (c) 2013年 Sheldon. All rights reserved.
//

#import "BHEmblemView.h"

static NSString *const BHEmblemViewImageName = @"emblem";

@implementation BHEmblemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *image = [UIImage imageNamed:BHEmblemViewImageName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = self.bounds;
        
        [self addSubview:imageView];
    }
    return self;
}

+ (CGSize)defaultSize
{
    return [UIImage imageNamed:BHEmblemViewImageName].size;
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
