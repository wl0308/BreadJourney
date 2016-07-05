//
//  MaMapViewController.m
//  BreadJourney
//
//  Created by Destiny on 15/10/30.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "MaMapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import "LongTripViewController.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width  //屏幕的宽
#define SCREEN_H [UIScreen mainScreen].bounds.size.height //屏幕的高

#define APIKey @"ab38f7925fe524ff289e9b8838b6dd4a"

@interface MaMapViewController ()<MAMapViewDelegate>
{
    MAMapView *maMapView;
}

@end

@implementation MaMapViewController


/**
 *  地图初始化
 */
- (void)initMapView
{
    [MAMapServices sharedServices].apiKey = APIKey;
    maMapView = [[MAMapView alloc] initWithFrame:self.view.frame];
    maMapView.delegate = self;
    maMapView.compassOrigin = CGPointMake(maMapView.compassOrigin.x, 22);
    maMapView.scaleOrigin  = CGPointMake(maMapView.scaleOrigin.x, 22);
    
    [self.view addSubview:maMapView];
    
    maMapView.showsUserLocation = YES;
    
    maMapView.userTrackingMode = MAUserTrackingModeFollow;
    
    maMapView.showsScale = NO; //隐藏地图自带的比例尺
    maMapView.showsCompass = NO; //隐藏地图自带的罗盘
    
    maMapView.customizeUserLocationAccuracyCircleRepresentation = YES;
    
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 40, 35, 35)];
    [backBtn setImage:[UIImage imageNamed:@"btn_map_back_normal"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"btn_map_back_pressed"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    
    [maMapView addSubview:backBtn];
    
    UIButton * followBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W - 50, 40, 35, 35)];
    [followBtn setImage:[UIImage imageNamed:@"btn_map_location_normal"] forState:UIControlStateNormal];
    [followBtn setImage:[UIImage imageNamed:@"btn_map_location_pressed"] forState:UIControlStateHighlighted];
    [followBtn addTarget:self action:@selector(follow) forControlEvents:UIControlEventTouchUpInside];
    
    [maMapView addSubview:followBtn];
    
    
    UIButton *starBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W * 0.2, SCREEN_H - 60, SCREEN_W * 0.6, 40)];
    [starBtn setImage:[UIImage imageNamed:@"btn_open_track_normal"] forState:UIControlStateNormal];
    [maMapView addSubview:starBtn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;

    [self initMapView];
    
}

#pragma mark Button Action 

/**
 *  backBtn按钮点击的响应事件
 */
- (void)goback
{
    [self.navigationController popViewControllerAnimated:YES];
    
    self.navigationController.navigationBar.hidden = NO;
}

/**
 *  followBtn按钮点击的响应事件
 */
- (void)follow
{
    maMapView.userTrackingMode = MAUserTrackingModeFollow;
}

@end
