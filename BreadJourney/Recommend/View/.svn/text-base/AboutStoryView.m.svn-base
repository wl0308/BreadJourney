//
//  AboutStoryView.m
//  BreadJourney
//
//  Created by administrator on 15/10/28.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "AboutStoryView.h"
#import "UIImageView+WebCache.h"

@implementation AboutStoryView

- (void)addViewToView:(AboutStory *)story {

//     self.frame = CGRectMake(0, 0, ([[UIScreen mainScreen] bounds].size.width - 24) /2, [[UIScreen mainScreen] bounds].size.height / 3);
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 3.0;
    
    UIImageView *storyImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ([[UIScreen mainScreen] bounds].size.width - 24) /2, [[UIScreen mainScreen] bounds].size.height / 15 * 3)];
    [storyImgView sd_setImageWithURL:[NSURL URLWithString:story.storyimage] placeholderImage:[UIImage imageNamed:@"cloud.jpg"]];
    //设置图片两个圆角
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, ([[UIScreen mainScreen] bounds].size.width - 24) /2, [[UIScreen mainScreen] bounds].size.height / 15 * 3) byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(3.0, 3.0)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, ([[UIScreen mainScreen] bounds].size.width - 24) /2, [[UIScreen mainScreen] bounds].size.height / 15 * 3);
    maskLayer.path = shadowPath.CGPath;
    storyImgView.layer.mask = maskLayer;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",story.storyimage]]];

    
    [self addSubview:storyImgView];
    
    
    UILabel *aboutStroyLab = [[UILabel alloc] initWithFrame:CGRectMake(10, [[UIScreen mainScreen] bounds].size.height / 15 * 3 + 5, [[UIScreen mainScreen] bounds].size.width / 2 - 25, 40)];
    aboutStroyLab.text = story.aboutstory;
    
    //自动换行
    
    [aboutStroyLab setNumberOfLines:0];
    UIFont *font = [UIFont systemFontOfSize:12];
    aboutStroyLab.font = font;
  
//    aboutStroyLab.textAlignment =NSTextAlignmentCenter;
    aboutStroyLab.numberOfLines = 2;
   
    [self addSubview:aboutStroyLab];
    
    UIImageView *headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, [[UIScreen mainScreen] bounds].size.height / 15 * 3 + 45, 20, 20)];

    
    headImgView.layer.cornerRadius = 10.0;
    headImgView.layer.masksToBounds = YES;
    
    [headImgView sd_setImageWithURL:[NSURL URLWithString:story.headimage] placeholderImage:[UIImage imageNamed:@"cloud.jpg"]];
    
    [self addSubview:headImgView];
    
     UILabel *usernameLab = [[UILabel alloc] initWithFrame:CGRectMake(40, [[UIScreen mainScreen] bounds].size.height / 15 * 3 + 45, 200, 20)];
    usernameLab.text = story.username;
    usernameLab.textColor = [UIColor colorWithRed:5.0 / 255.0f green:5.0 / 255.0f blue:5.0 / 255.0f alpha:0.5];
    
    usernameLab.font = [UIFont systemFontOfSize:13];
    
    [self addSubview:usernameLab];

}

@end
