//
//  TestCollectionViewCell.h
//  TintColorTest
//
//  Created by Nicolas Ameghino on 4/7/15.
//  Copyright (c) 2015 Nicolas Ameghino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestCollectionViewCell;
@protocol TestCollectionViewCellProtocol <NSObject>
-(void) cellButtonTapped:(TestCollectionViewCell *) cell;
@end

@interface TestCollectionViewCell : UICollectionViewCell
@property(weak, nonatomic) id<TestCollectionViewCellProtocol> delegate;

+(NSString *)ReuseIdentifier;
-(void) setCount:(NSInteger) i;
@end
