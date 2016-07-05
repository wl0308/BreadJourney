//
//  CityViewController.m
//  BreadJourney
//
//  Created by xingxing on 10/30/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import "CityViewController.h"
#import "common.h"

@interface CityViewController ()<UIWebViewDelegate>

@end

@implementation CityViewController

/**
 *  自定义导航栏
 */
- (void)initNav
{
    self.navigationController.navigationBar.hidden = NO;
    //隐藏导航栏背景
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"account_uploadavatar_btn"] forBarMetrics:UIBarMetricsCompact];
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
    
    //设置右侧按钮
    UIButton *positionbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    positionbtn.frame = CGRectMake(0, 0, 20, 20);
    [positionbtn setBackgroundImage:[UIImage imageNamed:@"im_poi_details_map_normal"] forState:UIControlStateNormal];
    [positionbtn setBackgroundImage:[UIImage imageNamed:@"im_poi_details_map_press"] forState:UIControlStateSelected];
    [positionbtn addTarget:self action:@selector(positionAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *positionItem = [[UIBarButtonItem alloc]initWithCustomView:positionbtn];
    
    UIButton *sharebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sharebtn.frame = CGRectMake(0, 0, 20, 20);
    [sharebtn setBackgroundImage:[UIImage imageNamed:@"me_share_normal"] forState:UIControlStateNormal];
    [sharebtn setBackgroundImage:[UIImage imageNamed:@"me_share_press"] forState:UIControlStateSelected];
    [sharebtn addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc]initWithCustomView:sharebtn];
    self.navigationItem.rightBarButtonItems = @[shareItem,positionItem];
}

//创建webview加载数据
- (void)creatWebView
{
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0,Screen_W , Screen_H)];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",des_trips_url,self.url]]];
    NSLog(@"%@",self.url);
    [webview loadRequest:request];
    
    [self.view addSubview:webview];
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNav];
    [self creatWebView];
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)positionAction
{
    
}

- (void)shareAction
{
    
}


@end
