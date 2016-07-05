//
//  CountryViewController.m
//  BreadJourney
//
//  Created by xingxing on 10/31/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import "CountryViewController.h"

@interface CountryViewController ()

@end

@implementation CountryViewController

/**
 *  自定义导航栏
 */
- (void)initNav
{
    self.navigationController.navigationBar.hidden = NO;
    //隐藏导航栏背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"account_uploadavatar_btn"] forBarMetrics:UIBarMetricsCompact];
    //    self.navigationController.
    
    //隐藏返回按钮
    [self.navigationItem setHidesBackButton:YES];
    //设置返回按钮
    UIButton *backbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backbtn.frame = CGRectMake(0, 0, 20, 20);
    [backbtn setBackgroundImage:[UIImage imageNamed:@"img_back_white_normal"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backbtn];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
