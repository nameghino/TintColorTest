//
//  TestCollectionViewCell.m
//  TintColorTest
//
//  Created by Nicolas Ameghino on 4/7/15.
//  Copyright (c) 2015 Nicolas Ameghino. All rights reserved.
//

#import "TestCollectionViewCell.h"

static NSArray *colors;

@interface TestCollectionViewCell ()
@property(weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation TestCollectionViewCell

+(void)load {
    colors = @[[UIColor blueColor], [UIColor greenColor], [UIColor yellowColor], [UIColor redColor], [UIColor whiteColor]];
}

-(void)awakeFromNib {
    [self.button addTarget:self action:@selector(buttonHandler:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) buttonHandler:(id) sender {
    [self.delegate cellButtonTapped:self];
}

-(void)setHighlighted:(BOOL)highlighted {
}

-(BOOL)isHighlighted {
    return NO;
}

-(void)setCount:(NSInteger)i {
    i = i % [colors count];
    UIColor *color = colors[i];
    [self.button setTintColor:color];
}

+(NSString *)ReuseIdentifier {
     return @"ReuseMe";
}

@end
