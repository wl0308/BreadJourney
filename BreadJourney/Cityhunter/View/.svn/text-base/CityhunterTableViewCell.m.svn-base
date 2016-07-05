//
//  CityhunterTableViewCell.m
//  BreadJourney
//
//  Created by administrator on 15/10/28.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "CityhunterTableViewCell.h"

#define NAVSIZE_H self.navigationController.navigationBar.frame.size.height  //导航栏的高
#define NAVSIZE_W self.navigationController.navigationBar.frame.size.width   //导航栏的宽
#define MAINSIZE_W [UIScreen mainScreen].bounds.size.width
#define MAINSIZE_H [UIScreen mainScreen].bounds.size.height
@implementation CityhunterTableViewCell

-(void)cityhunterShow{
    UIImageView *scene=[[UIImageView alloc]initWithFrame:CGRectMake(MAINSIZE_W/64*3, MAINSIZE_H/32, MAINSIZE_W-MAINSIZE_W/32*3, MAINSIZE_H/3)];

#warning 这里给scene添加背景图片
    scene.backgroundColor=[UIColor blackColor];
    [self.contentView addSubview:scene];

    UIButton *hunter=[[UIButton alloc]initWithFrame:CGRectMake(MAINSIZE_W/32*23, MAINSIZE_H/24*7, MAINSIZE_W/32*7, MAINSIZE_W/32*7)];
    hunter.layer.masksToBounds=YES;
    hunter.layer.cornerRadius=hunter.bounds.size.width/2;
    hunter.backgroundColor=[UIColor blueColor];
#warning 这里给hunter添加背景图片
    [self.contentView addSubview:hunter];
    [self.superview bringSubviewToFront:self];
    
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(MAINSIZE_W/16, MAINSIZE_H/3+MAINSIZE_H/32, MAINSIZE_W/16*10, MAINSIZE_H/6)];
#warning 这里给title添加数据
    title.backgroundColor=[UIColor redColor];
    title.adjustsFontSizeToFitWidth=YES;
    title.numberOfLines=0;
    [self.contentView addSubview:title];
    
    UILabel *message=[[UILabel alloc]initWithFrame:CGRectMake(MAINSIZE_W/16, MAINSIZE_H/24*13, MAINSIZE_W-MAINSIZE_W/8, MAINSIZE_H/24)];
    message.backgroundColor=[UIColor yellowColor];
#warning 这里添加time,place,liker信息（place可以为空）
#pragma 先判断place里面有没有值，有的话就分为三部分，没有就分为两部分
    [self.contentView addSubview:message];
    
    _markView=[[UIView alloc]initWithFrame:CGRectMake(MAINSIZE_W/16, MAINSIZE_H/12*7, MAINSIZE_W/4*3, MAINSIZE_H/12)];
#warning 这里添加mark的数量与内容
    NSArray *markArr=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    if (markArr.count<=3) {
        for (int i=0; i<markArr.count; i++) {
            UILabel *mark=[[UILabel alloc]initWithFrame:CGRectMake(MAINSIZE_W/4*i, 0, MAINSIZE_W/16*3, MAINSIZE_H/24)];
            mark.text=markArr[i];
            mark.textAlignment=NSTextAlignmentCenter;
            mark.textColor=[UIColor colorWithRed:95.0f/255.0f green:95.0f/255.0f blue:95.0f/255.0f alpha:0.5];
            mark.layer.borderWidth=1.5f;
            mark.layer.borderColor=[[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0/255.0f alpha:0.5]CGColor];
            mark.layer.cornerRadius=5;
            mark.adjustsFontSizeToFitWidth=YES;
            [_markView addSubview:mark];
        }
    }else if(markArr.count>3){
        for (int i=0; i<3; i++) {
            UILabel *mark=[[UILabel alloc]initWithFrame:CGRectMake(MAINSIZE_W/4*i, 0, MAINSIZE_W/16*3, MAINSIZE_H/24)];
            mark.text=markArr[i];
            mark.textAlignment=NSTextAlignmentCenter;
            mark.textColor=[UIColor colorWithRed:95.0f/255.0f green:95.0f/255.0f blue:95.0f/255.0f alpha:0.5];
            mark.layer.borderWidth=1.5f;
            mark.layer.borderColor=[[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0/255.0f alpha:0.5]CGColor];
            mark.layer.cornerRadius=5;
            mark.adjustsFontSizeToFitWidth=YES;
            [_markView addSubview:mark];
        }
        for (int j=0; j<markArr.count-3; j++) {
            UILabel *mark1=[[UILabel alloc]initWithFrame:CGRectMake(MAINSIZE_W/4*j, MAINSIZE_H/24+MAINSIZE_H/48, MAINSIZE_W/16*3, MAINSIZE_H/24)];
            mark1.text=markArr[j+3];
            mark1.textAlignment=NSTextAlignmentCenter;
            mark1.textColor=[UIColor colorWithRed:95.0f/255.0f green:95.0f/255.0f blue:95.0f/255.0f alpha:0.5];
            mark1.layer.borderWidth=1.5f;
            mark1.layer.borderColor=[[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0/255.0f alpha:0.5]CGColor];
            mark1.layer.cornerRadius=5;
            mark1.adjustsFontSizeToFitWidth=YES;
            [_markView addSubview:mark1];
        }
    }
    [self.contentView addSubview:_markView];
    
    UILabel *price=[[UILabel alloc]initWithFrame:CGRectMake(MAINSIZE_W/32*25, MAINSIZE_H/12*7, MAINSIZE_W/16*3, MAINSIZE_H/8)];
    price.textColor=[UIColor redColor];
#warning 这个添加price的数据，并且在price前加上￥
    price.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:price];
}
@end
