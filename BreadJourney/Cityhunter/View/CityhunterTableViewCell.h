//
//  CityhunterTableViewCell.h
//  BreadJourney
//
//  Created by administrator on 15/10/28.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cityhunter.h"

@interface CityhunterTableViewCell : UITableViewCell
@property(nonatomic,strong)Cityhunter * cityhunter;
@property(nonatomic,strong)UIView * markView;
@property(nonatomic,assign)NSInteger * row;
@property(nonatomic,strong)UIImageView * scene;
@property(nonatomic,strong)UIImageView * hunter;
@property(nonatomic,strong)UILabel * title;
@property(nonatomic,strong)UILabel * message;
@property(nonatomic,strong)UILabel * mark;
@property(nonatomic,strong)UILabel * mark1;
@property(nonatomic,strong)UILabel * price;
-(void)cityhunterShow;
@end
