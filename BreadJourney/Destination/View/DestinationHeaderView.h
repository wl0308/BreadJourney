//
//  DestinationHeaderView.h
//  BreadJourney
//
//  Created by administrator on 10/27/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DesType.h"

@protocol HeaderClickDelegate <NSObject>

- (void)headerbtnClick;

@end

@interface DestinationHeaderView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIImageView *headerimg;
@property (weak, nonatomic) IBOutlet UILabel *headertitle;
@property (weak, nonatomic) IBOutlet UIButton *right_arrow;
@property (weak, nonatomic) IBOutlet UIButton *headerbtn;


@property (nonatomic, strong) id<HeaderClickDelegate> delegate;

- (void)setHeaderView:(DesType *)destype with:(NSInteger)section;


@end
