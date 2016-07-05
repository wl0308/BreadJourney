//
//  DestinationHeaderView.m
//  BreadJourney
//
//  Created by administrator on 10/27/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import "DestinationHeaderView.h"
#import "common.h"

@interface DestinationHeaderView()

@end

@implementation DestinationHeaderView

- (void)setHeaderView:(DesType *)destype with:(NSInteger)section
{
    
    self.headerimg.image = [UIImage imageNamed:@"im_featured_item_shu_line"];
    self.headertitle.text = destype.title;
    [self.right_arrow setImage:[UIImage imageNamed:@"im_poi_arrow"] forState:UIControlStateNormal];
    [self.right_arrow setHidden:YES];
    if (section == 2 || section == 5 || section == 6)
    {
        [self.right_arrow setHidden:NO];
        [self.headerbtn addTarget:self action:@selector(headerbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

- (void)headerbtnClick
{
    if ([self.delegate respondsToSelector:@selector(headerbtnClick)])
    {
        [self.delegate headerbtnClick];
    }
}

@end
