//
//  AboveUpViewController.m
//  BreadJourney
//
//  Created by administrator on 15/10/27.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "AboveUpViewController.h"

@interface AboveUpViewController ()
@property (weak, nonatomic) IBOutlet UIButton *taiguoBtn;
@property (weak, nonatomic) IBOutlet UIButton *hanguoBtn;
@property (weak, nonatomic) IBOutlet UIButton *ribenBtn;
@property (weak, nonatomic) IBOutlet UIButton *faguoBtn;
@property (weak, nonatomic) IBOutlet UIButton *meiguoBtn;
@property (weak, nonatomic) IBOutlet UIButton *yidaliBtn;
@property (weak, nonatomic) IBOutlet UIButton *malaixiyaBtn;
@property (weak, nonatomic) IBOutlet UIButton *yingguoBtn;
@property (weak, nonatomic) IBOutlet UIButton *xinjiapoBtn;
@property (weak, nonatomic) IBOutlet UIButton *xilaBtn;
@property (weak, nonatomic) IBOutlet UIButton *ruishiBtn;
@property (weak, nonatomic) IBOutlet UIButton *deguoBtn;
@property (weak, nonatomic) IBOutlet UIButton *taiwanBtn;
@property (weak, nonatomic) IBOutlet UIButton *xianggangBtn;
@property (weak, nonatomic) IBOutlet UIButton *xiamenBtn;
@property (weak, nonatomic) IBOutlet UIButton *beijingBtn;
@property (weak, nonatomic) IBOutlet UIButton *lijiangBtn;
@property (weak, nonatomic) IBOutlet UIButton *chengduBtn;
@property (weak, nonatomic) IBOutlet UIButton *shanghaiBtn;
@property (weak, nonatomic) IBOutlet UIButton *lasaBtn;
@property (weak, nonatomic) IBOutlet UIButton *xianBtn;
@property (weak, nonatomic) IBOutlet UIButton *daliBtn;
@property (weak, nonatomic) IBOutlet UIButton *danyaBtn;






@end

@implementation AboveUpViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
 
    
    //ui完善
    
    [self changeBtn:self.taiguoBtn];
    [self changeBtn:self.hanguoBtn];
    [self changeBtn:self.ribenBtn];
    [self changeBtn:self.faguoBtn];
    [self changeBtn:self.meiguoBtn];
    [self changeBtn:self.yidaliBtn];
    [self changeBtn:self.malaixiyaBtn];
    [self changeBtn:self.yingguoBtn];
    [self changeBtn:self.xinjiapoBtn];
    [self changeBtn:self.xilaBtn];
    [self changeBtn:self.ruishiBtn];
    [self changeBtn:self.deguoBtn];
    [self changeBtn:self.taiwanBtn];
    [self changeBtn:self.xianggangBtn];
    [self changeBtn:self.xiamenBtn];
    [self changeBtn:self.beijingBtn];
    [self changeBtn:self.lijiangBtn];
    [self changeBtn:self.chengduBtn];
    [self changeBtn:self.shanghaiBtn];
    [self changeBtn:self.lasaBtn];
    [self changeBtn:self.xianBtn];
    [self changeBtn:self.daliBtn];
    [self changeBtn:self.danyaBtn];
 
    
}

- (void)dropDown {

    
    //设定动画
    
    CABasicAnimation *aboveAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    aboveAnimation.toValue = [NSNumber numberWithFloat:0];
    aboveAnimation.fromValue = [NSNumber numberWithFloat:-[[UIScreen mainScreen] bounds].size.height];
    
    aboveAnimation.duration = 0.2;
    
    //开始
    [self.view.layer addAnimation:aboveAnimation forKey:@"aboveAnimation"];
    
    
}
- (void)getDown {

    
    //设定动画
    
    CABasicAnimation *aboveAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    aboveAnimation.toValue = [NSNumber numberWithFloat:-[[UIScreen mainScreen] bounds].size.height];
    aboveAnimation.fromValue =[NSNumber numberWithFloat:0];
    
    aboveAnimation.duration = 0.2;
    
    //开始
    [self.view.layer addAnimation:aboveAnimation forKey:@"aboveAnimation"];
    
}

- (void)changeBtn:(UIButton *)btn {

    [btn.layer setCornerRadius:10.0];
    btn.layer.masksToBounds =YES;
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor colorWithRed:48.0 / 255.0f green:161.0 / 255.0f blue:181.0 / 255.0f alpha:0.5].CGColor;
    
}



@end
