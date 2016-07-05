//
//  DestinationCollectionViewCell.h
//  BreadJourney
//
//  Created by administrator on 10/27/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DesImgs.h"

@interface DestinationCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *desImgView;

@property (weak, nonatomic) IBOutlet UILabel *destitle;

- (void)setCell:(DesImgs *)desimgs;


@end
