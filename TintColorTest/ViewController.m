//
//  ViewController.m
//  TintColorTest
//
//  Created by Nicolas Ameghino on 4/7/15.
//  Copyright (c) 2015 Nicolas Ameghino. All rights reserved.
//

#import "ViewController.h"
#import "TestCollectionViewCell.h"


@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, TestCollectionViewCellProtocol>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *counts;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.counts = [NSMutableArray array];
    for (int i=0; i < [self collectionView:nil numberOfItemsInSection:0]; ++i) {
        [self.counts addObject:@(0)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonHandler:(id)sender {
    [self play:sender];
}

-(void) play:(id) sender {
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView { return 1; }
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section { return 20; }
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestCollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:[TestCollectionViewCell ReuseIdentifier]
                                              forIndexPath:indexPath];
    
    cell.delegate = self;
    [cell setCount:[self.counts[indexPath.row] integerValue]];
    return cell;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

-(void)cellButtonTapped:(TestCollectionViewCell *)cell {
    NSIndexPath *ip = [self.collectionView indexPathForCell:cell];
    NSInteger count = [self.counts[ip.row] integerValue];
    self.counts[ip.row] = @(count+1);
    [self.collectionView reloadItemsAtIndexPaths:@[ip]];
}

@end
