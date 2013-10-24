//
//  BHCollectionViewController.m
//  DemoOFUICollectionView
//
//  Created by Sheldon on 13-10-24.
//  Copyright (c) 2013年 Sheldon. All rights reserved.
//

#import "BHCollectionViewController.h"
#import "BHPhotoAlbumLayout.h"
#import "BHAlbumPhotoCell.h"
#import "BHAlbum.h"
#import "BHPhoto.h"

static NSString *const PhotoCellIdentifier = @"PhotoCell";

@interface BHCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *albums;
@property (nonatomic, weak) IBOutlet BHPhotoAlbumLayout *photoAlbumLayout;

@end

@implementation BHCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.albums = [NSMutableArray array];
    NSURL *urlPrefix = [NSURL URLWithString:@"https://raw.github.com/ShadoFlameX/PhotoCollectionView/master/Photos/"];
    NSInteger photoIndex = 0;
    
    for (NSInteger a = 0; a < 12; a++) {
        BHAlbum *album = [[BHAlbum alloc] init];
        album.name = [NSString stringWithFormat:@"photo Album %ld",a + 1];
        
        NSUInteger photoCount = 1;
        for (NSInteger p = 0; p < photoCount; p++) {
            NSString *photoFileName = [NSString stringWithFormat:@"thumbnail%ld.jpg", photoIndex % 25];
            NSURL *photoURL = [urlPrefix URLByAppendingPathComponent:photoFileName];
            BHPhoto *photo = [BHPhoto photoWithImageURL:photoURL];
            [album addPhoto:photo];
            
            photoIndex ++;
        }
        
        [self.albums addObject:album];
    }
    
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1.0];
    [self.collectionView registerClass:[BHAlbumPhotoCell class] forCellWithReuseIdentifier:PhotoCellIdentifier];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Rotation -

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        self.photoAlbumLayout.numberOfColumns = 3;
        CGFloat sideInset = [UIScreen mainScreen].preferredMode.size.width == 1136 ? 45 : 25;
        self.photoAlbumLayout.itemInsets = UIEdgeInsetsMake(22, sideInset, 13, sideInset);
    } else {
        self.photoAlbumLayout.numberOfColumns = 2;
        self.photoAlbumLayout.itemInsets = UIEdgeInsetsMake(22, 22, 13, 22);
    }
}

#pragma mark - UICollectionViewDataSource -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BHAlbumPhotoCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoCellIdentifier forIndexPath:indexPath];
    
    return photoCell;
}

@end
