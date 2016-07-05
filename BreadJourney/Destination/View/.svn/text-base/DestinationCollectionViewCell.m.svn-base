//
//  DestinationCollectionViewCell.m
//  BreadJourney
//
//  Created by administrator on 10/27/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import "DestinationCollectionViewCell.h"
#import "DesImgs.h"
#import "UIImageView+AFNetworking.h"

@implementation DestinationCollectionViewCell

- (void)setCell:(DesImgs *)desimgs
{
    //设置cell属性
    self.desImgView.layer.masksToBounds = YES;
    self.desImgView.layer.cornerRadius = 5;
    [self.desImgView setImageWithURL:[NSURL URLWithString:desimgs.image]];
    self.destitle.text = desimgs.imgtitle;
    
}

@end
