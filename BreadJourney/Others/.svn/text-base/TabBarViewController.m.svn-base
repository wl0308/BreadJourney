//
//  TabBarViewController.m
//  BreadJourney
//
//  Created by Destiny on 15/10/27.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "TabBarViewController.h"
#import "LongTripViewController.h"


#define SCREEN_W [UIScreen mainScreen].bounds.size.width  //屏幕的宽
#define SCREEN_H [UIScreen mainScreen].bounds.size.height //屏幕的高


@interface TabBarViewController (){
    UIImageView *addView;
    BOOL flag;
}

@property(nonatomic,strong) UIView *myView;


//自定义的长篇游记和生活故事按钮
@property(nonatomic,strong) UIButton *btn_longTrip;
@property(nonatomic,strong) UIButton *btn_spot;

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    flag = YES; //设置 + 的状态
    
    /**
     推荐
     */
    _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn1.frame = CGRectMake(0, SCREEN_H - 44, SCREEN_W / 5, 44);
    
    [_btn1 setImage:[UIImage imageNamed:@"tabbar_explore_selected"] forState:UIControlStateNormal];
    [_btn1 setTitle:@"tabbar_explore_selected" forState:UIControlStateNormal];
    
    [_btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _btn1.tag =0;
    
    
    /**
     城市猎人
     */
    _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn2.frame = CGRectMake(SCREEN_W / 5, SCREEN_H - 44, SCREEN_W / 5, 44);
    
    [_btn2 setImage:[UIImage imageNamed:@"tabbar_cityhunter_normal"] forState:UIControlStateNormal];
    [_btn2 setTitle:@"tabbar_cityhunter_selected" forState:UIControlStateNormal];
    
    [_btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _btn2.tag =1;
    
    
    /**
     +
     */
    _btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn3.frame = CGRectMake(SCREEN_W / 5  * 2, SCREEN_H - 44, SCREEN_W / 5, 44);
    
    [_btn3 setBackgroundImage:[UIImage imageNamed:@"tabbar_trip_bg.9"] forState:UIControlStateNormal];
    [_btn3 setBackgroundImage:[UIImage imageNamed:@"tabbar_trip_bg.9"] forState:UIControlStateHighlighted];
    
    [_btn3 addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    
    addView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_W / 10 - 9, 13, 18, 18)];
    addView.image = [UIImage imageNamed:@"tabbar_trip_add"];
    [_btn3 addSubview:addView];
    
    //创建一个View并设置其透明度
    _myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 44)];
    _myView.backgroundColor = [UIColor grayColor];
    _myView.alpha = 0.2;
    _myView.hidden = YES;
    
    [self.view addSubview:_myView];
    
    
    /**
     目的地
     */
    _btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn4.frame = CGRectMake(SCREEN_W / 5 * 3, SCREEN_H - 44, SCREEN_W / 5, 44);
    
    [_btn4 setImage:[UIImage imageNamed:@"tabbar_destination_normal"] forState:UIControlStateNormal];
    [_btn4 setTitle:@"tabbar_destination_selected" forState:UIControlStateNormal];
    
    [_btn4 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _btn4.tag =2;
    
    
    /**
     我的
     */
    _btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn5.frame = CGRectMake(SCREEN_W / 5 * 4, SCREEN_H - 44, SCREEN_W / 5, 44);
    
    [_btn5 setImage:[UIImage imageNamed:@"tabbar_me_normal"] forState:UIControlStateNormal];
    [_btn5 setTitle:@"tabbar_me_selected" forState:UIControlStateNormal];
    
    [_btn5 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _btn5.tag =3;

    [self.tabBar removeFromSuperview];
    
    [self.view addSubview:_btn1];
    [self.view addSubview:_btn2];
    [self.view addSubview:_btn3];
    [self.view addSubview:_btn4];
    [self.view addSubview:_btn5];

}


/**
 *  点击btn所对应的点击事件
 */
- (void)btnClick:(UIButton *)btn
{
    self.selectedIndex = btn.tag; //跳转到对应的ViewControl
    
    /**
     点击时btn图片的变化
     */
    if(btn.tag == 0)
    {
        [_btn1 setImage:[UIImage imageNamed:btn.titleLabel.text] forState:UIControlStateNormal];
        [_btn2 setImage:[UIImage imageNamed:@"tabbar_cityhunter_normal"] forState:UIControlStateNormal];
        [_btn4 setImage:[UIImage imageNamed:@"tabbar_destination_normal"] forState:UIControlStateNormal];
        [_btn5 setImage:[UIImage imageNamed:@"tabbar_me_normal"] forState:UIControlStateNormal];
        
    }else if(btn.tag == 1)
    {
        [_btn1 setImage:[UIImage imageNamed:@"tabbar_explore_normal"] forState:UIControlStateNormal];
        [_btn2 setImage:[UIImage imageNamed:btn.titleLabel.text] forState:UIControlStateNormal];
        [_btn4 setImage:[UIImage imageNamed:@"tabbar_destination_normal"] forState:UIControlStateNormal];
        [_btn5 setImage:[UIImage imageNamed:@"tabbar_me_normal"] forState:UIControlStateNormal];
        
    }else if (btn.tag == 2)
    {
        [_btn1 setImage:[UIImage imageNamed:@"tabbar_explore_normal"] forState:UIControlStateNormal];
        [_btn2 setImage:[UIImage imageNamed:@"tabbar_cityhunter_normal"] forState:UIControlStateNormal];
        [_btn4 setImage:[UIImage imageNamed:btn.titleLabel.text] forState:UIControlStateNormal];
        [_btn5 setImage:[UIImage imageNamed:@"tabbar_me_normal"] forState:UIControlStateNormal];
        
    }else if(btn.tag == 3)
    {
        [_btn1 setImage:[UIImage imageNamed:@"tabbar_explore_normal"] forState:UIControlStateNormal];
        [_btn2 setImage:[UIImage imageNamed:@"tabbar_cityhunter_normal"] forState:UIControlStateNormal];
        [_btn4 setImage:[UIImage imageNamed:@"tabbar_destination_normal"] forState:UIControlStateNormal];
        [_btn5 setImage:[UIImage imageNamed:btn.titleLabel.text] forState:UIControlStateNormal];
    }
    if (flag) {
        
    }else{
        
        //addView的旋转动画
        [UIView animateWithDuration:0.4 animations:^{
            addView.transform = CGAffineTransformMakeRotation(0);
        } completion:^(BOOL finished) {
            flag = YES;
        }];
        
        [_btn_longTrip removeFromSuperview];
        [_btn_spot removeFromSuperview];
        
        //隐藏View
        _myView.hidden = YES;
    }
}


/**
 *  + 对应的响应事件
 */
- (void)addClick
{
    if(flag)
    {
        //addView的旋转动画
        _btn3.userInteractionEnabled = NO;
        [UIView animateWithDuration:0.4 animations:^{
            addView.transform = CGAffineTransformMakeRotation(-M_PI * 0.25);
        } completion:^(BOOL finished) {
            flag = NO;
            _btn3.userInteractionEnabled = YES;
        }];
        
        //显示View
        _myView.hidden = NO;
        
        
        /**
         长篇游记
         */
        _btn_longTrip = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W * 0.375, SCREEN_H - 68 - SCREEN_W * 0.5, SCREEN_W * 0.25, SCREEN_W * 0.25)];
        [_btn_longTrip setImage:[UIImage imageNamed:@"root_tab_longtrip_btn"] forState:UIControlStateNormal];
        [_btn_longTrip addTarget:self action:@selector(longTrip) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:_btn_longTrip];
        
        //平移动画
        CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        moveAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_W * 0.5, SCREEN_H - 44)];
        moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_W * 0.5, SCREEN_H - 68 - SCREEN_W * 0.375)];
        moveAnimation.autoreverses = NO;
        moveAnimation.repeatCount = 0;
        moveAnimation.duration = 0.3;
        
        //缩放动画
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = [NSNumber numberWithFloat:0];
        scaleAnimation.toValue = [NSNumber numberWithFloat:1];
        scaleAnimation.autoreverses = NO;
        scaleAnimation.repeatCount = 0;
        moveAnimation.duration = 0.3;
        
        //旋转动画
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        rotationAnimation.fromValue = [NSNumber numberWithFloat:0.f];
        rotationAnimation.toValue = [NSNumber numberWithFloat:-M_PI];
        rotationAnimation.autoreverses = NO;
        rotationAnimation.repeatCount = 0;
        rotationAnimation.duration = 0.3;
        
        //组合动画
        CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
        groupAnimation.duration = 0.3;
        groupAnimation.autoreverses = NO;
        groupAnimation.animations = @[moveAnimation,scaleAnimation,rotationAnimation];
        groupAnimation.repeatCount = 0;
        
        [_btn_longTrip.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
        
        
        /**
         生活故事
         */
        _btn_spot = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W * 0.375, SCREEN_H - 65 - SCREEN_W * 0.25, SCREEN_W * 0.25, SCREEN_W * 0.25)];
        [_btn_spot setImage:[UIImage imageNamed:@"root_tab_spot_btn"] forState:UIControlStateNormal];
        [_btn_spot addTarget:self action:@selector(spot) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_btn_spot];
        
        //平移动画
        CABasicAnimation *moveAnimation2 = [CABasicAnimation animationWithKeyPath:@"position"];
        moveAnimation2.fromValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_W * 0.5, SCREEN_H - 22)];
        moveAnimation2.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_W * 0.5, SCREEN_H - 65 - SCREEN_W * 0.125)];
        moveAnimation2.autoreverses = NO;
        moveAnimation2.repeatCount = 0;
        moveAnimation2.duration = 0.3;
        
        //缩放动画
        CABasicAnimation *scaleAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation2.fromValue = [NSNumber numberWithFloat:0];
        scaleAnimation2.toValue = [NSNumber numberWithFloat:1];
        scaleAnimation2.autoreverses = NO;
        scaleAnimation2.repeatCount = 0;
        moveAnimation2.duration = 0.3;
        
        //组合动画
        CAAnimationGroup *groupAnimation2 = [CAAnimationGroup animation];
        groupAnimation2.duration = 0.3;
        groupAnimation2.autoreverses = NO;
        groupAnimation2.animations = @[moveAnimation2,scaleAnimation2,rotationAnimation];
        groupAnimation2.repeatCount = 0;
        
        [_btn_spot.layer addAnimation:groupAnimation2 forKey:@"groupAnimation2"];
        
    }else{
        
        _btn3.userInteractionEnabled = NO;
        
        //addView的旋转动画
        [UIView animateWithDuration:0.4 animations:^{
            addView.transform = CGAffineTransformMakeRotation(0);
        } completion:^(BOOL finished) {
            flag = YES;
            _btn3.userInteractionEnabled = YES;
        }];
        
        
        /**
          长篇游记对应的动画
         */
        
        //平移动画
        CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        moveAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_W * 0.5, SCREEN_H - 68 - SCREEN_W * 0.375)];
        moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_W * 0.5, SCREEN_H - 44)];
        moveAnimation.autoreverses = NO;
        moveAnimation.repeatCount = 0;
        moveAnimation.duration = 0.3;
        
        
        //旋转动画
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        rotationAnimation.fromValue = [NSNumber numberWithFloat:0.f];
        rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI];
        rotationAnimation.autoreverses = NO;
        rotationAnimation.repeatCount = 0;
        rotationAnimation.duration = 0.3;
        
        //组合动画
        CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
        groupAnimation.duration = 0.3;
        groupAnimation.autoreverses = NO;
        groupAnimation.animations = @[moveAnimation,rotationAnimation];
        groupAnimation.repeatCount = 0;
        
        
        /**
          生活故事对应的动画
         */
        
        //平移动画
        CABasicAnimation *moveAnimation2 = [CABasicAnimation animationWithKeyPath:@"position"];
        moveAnimation2.fromValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_W * 0.5, SCREEN_H - 65 - SCREEN_W * 0.125)];
        moveAnimation2.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_W * 0.5, SCREEN_H - 22)];
        moveAnimation2.autoreverses = NO;
        moveAnimation2.repeatCount = 0;
        moveAnimation2.duration = 0.3;
        
        
        //旋转动画
        CABasicAnimation *rotationAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        rotationAnimation2.fromValue = [NSNumber numberWithFloat:0.f];
        rotationAnimation2.toValue = [NSNumber numberWithFloat:M_PI];
        rotationAnimation2.autoreverses = NO;
        rotationAnimation2.repeatCount = 0;
        rotationAnimation2.duration = 0.3;
        
        //组合动画
        CAAnimationGroup *groupAnimation2 = [CAAnimationGroup animation];
        groupAnimation2.duration = 0.3;
        groupAnimation2.autoreverses = NO;
        groupAnimation2.animations = @[moveAnimation2,rotationAnimation2];
        groupAnimation2.repeatCount = 0;
        
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _btn_longTrip.transform = CGAffineTransformScale(_btn_longTrip.transform, 0.1, 0.1);
            [_btn_longTrip.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
            
            _btn_spot.transform = CGAffineTransformScale(_btn_spot.transform , 0.1, 0.1);
            [_btn_spot.layer addAnimation:groupAnimation2 forKey:@"groupAnimation2"];
            
            
        } completion:^(BOOL finished) {
            
            [_btn_longTrip removeFromSuperview];
            [_btn_spot removeFromSuperview];
        }];
        
        
        //隐藏View
        _myView.hidden = YES;
    }
    
}


/**
 *  长篇游记对应的响应事件
 */
- (void)longTrip
{
    
    //LongTripViewController *ltVC = [[[NSBundle mainBundle] loadNibNamed:@"LongTripViewController" owner:nil options:nil]lastObject];
    LongTripViewController *ltVC = [[LongTripViewController alloc]initWithNibName:@"LongTripViewController" bundle:nil];
    //[self presentViewController:ltNavController animated:YES completion:nil];
    
    [self.navigationController pushViewController:ltVC animated:YES];
    
    
}


/**
 *  生活故事对应的响应事件
 */
- (void)spot
{
    TabBarViewController *tabbar = [[TabBarViewController alloc]init];
    tabbar.hidesBottomBarWhenPushed = YES;
}

@end
