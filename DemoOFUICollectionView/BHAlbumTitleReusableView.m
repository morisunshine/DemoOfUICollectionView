//
//  BHAlbumTitleReusableView.m
//  DemoOFUICollectionView
//
//  Created by Sheldon on 13-10-25.
//  Copyright (c) 2013年 Sheldon. All rights reserved.
//

#import "BHAlbumTitleReusableView.h"

static NSString * const AlbumTitleIdentifier = @"AlbumTitle";

@interface BHAlbumTitleReusableView ()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;

@end

@implementation BHAlbumTitleReusableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        self.titleLabel.textColor = [UIColor colorWithWhite:1 alpha:1];
        self.titleLabel.shadowColor = [UIColor colorWithWhite:0 alpha:0.3];
        self.titleLabel.shadowOffset = CGSizeMake(0, 1);
        
        [self addSubview:self.titleLabel];
        // Initialization code
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.titleLabel.text = nil;
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
