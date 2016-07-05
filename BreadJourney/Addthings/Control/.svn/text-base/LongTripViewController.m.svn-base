//
//  LongTripViewController.m
//  BreadJourney
//
//  Created by Destiny on 15/10/28.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "LongTripViewController.h"
#import <MAMapKit/MAMapKit.h>
#import "MaMapViewController.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width  //屏幕的宽
#define SCREEN_H [UIScreen mainScreen].bounds.size.height //屏幕的高

#define APIKey @"ab38f7925fe524ff289e9b8838b6dd4a"

@interface LongTripViewController ()<UIActionSheetDelegate,MAMapViewDelegate>
{
    MAMapView *maMapView;
    UIScrollView *scrollView;
}

@property (nonatomic, strong) UIImageView *contentineImageView;

@property (nonatomic, strong) UIImageView *bgImageView;

@end

@implementation LongTripViewController


/**
 *  地图初始化
 */
- (void)initMapView
{
    [MAMapServices sharedServices].apiKey = APIKey;
    
    maMapView = [[MAMapView alloc] initWithFrame:CGRectMake(10, SCREEN_H * 0.7 + 10, SCREEN_W - 20, SCREEN_H * 0.25)];
    maMapView.delegate = self;
    maMapView.compassOrigin = CGPointMake(maMapView.compassOrigin.x, 22);
    maMapView.scaleOrigin  = CGPointMake(maMapView.scaleOrigin.x, 22);
    maMapView.layer.cornerRadius = 4;
    maMapView.distanceFilter = 10.0;
    
    [scrollView addSubview:maMapView];
    
    maMapView.showsUserLocation = YES;
    
    //maMapView.userTrackingMode = MAUserTrackingModeFollow;
    
    maMapView.showsScale = NO; //隐藏地图自带的比例尺
    maMapView.showsCompass = NO; //隐藏地图自带的罗盘
    
    maMapView.customizeUserLocationAccuracyCircleRepresentation = YES;
    
    //开启追踪按钮
    UIButton *startBtn = [[UIButton alloc]initWithFrame:CGRectMake(maMapView.frame.size.width - 70, 10, 60, 20)];
    startBtn.backgroundColor = [UIColor orangeColor];
    [startBtn setTitle:@"开启追踪" forState:UIControlStateNormal];
    startBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    startBtn.layer.cornerRadius = 2;
    
    [maMapView addSubview:startBtn];
    
    UIButton *mapBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, SCREEN_H * 0.7 + 10, SCREEN_W - 20, SCREEN_H * 0.25)];
    mapBtn.backgroundColor = [UIColor clearColor];
    
    [mapBtn addTarget:self action:@selector(toMap) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addSubview:mapBtn];
    
    
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _contentineImageView.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    _contentineImageView.hidden = NO;
}

- (UIImageView *)findHairlineImgaeViewUnder:(UIView *)view{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height<= 1.0){
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews){
        UIImageView *imageView = [self findHairlineImgaeViewUnder:subview];
        if(imageView){
            return imageView;
        }
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationController.navigationBar.hidden = NO;
    
    //self.view.backgroundColor = [UIColor blackColor];
    
    //设置导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"feed_nav_bottom_bar"] forBarMetrics:UIBarMetricsCompact];
    
    //隐藏导航栏下的线
    _contentineImageView = [self findHairlineImgaeViewUnder:self.navigationController.navigationBar];
    //self.navigationController.navigationBar.translucent = NO;
    
    /**
     自定义导航栏左侧按钮
     */
    [self.navigationItem setHidesBackButton:YES];
    
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goBackBtn.frame = CGRectMake(0, 0 , 15, 15);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"icon_nav_back_button"] forState:UIControlStateNormal];
    
    [goBackBtn addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:goBackBtn];
    self.navigationItem.leftBarButtonItem = back;
    
    
    /**
     自定义导航栏右侧按钮
     */
    UIButton *refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    refreshBtn.frame = CGRectMake(0, 0 , 15, 15);
    [refreshBtn setBackgroundImage:[UIImage imageNamed:@"btn_tripedit_sync_normal"] forState:UIControlStateNormal];
    
    [refreshBtn addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithCustomView:refreshBtn];
    
    UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    setBtn.frame = CGRectMake(0, 0 , 15, 15);
    [setBtn setBackgroundImage:[UIImage imageNamed:@"btn_tripedit_setting_normal"] forState:UIControlStateNormal];
    
    [setBtn addTarget:self action:@selector(set) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *set = [[UIBarButtonItem alloc] initWithCustomView:setBtn];

    UIButton *nullBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nullBtn.frame = CGRectMake(0, 0 , 15, 15);
    [nullBtn setBackgroundImage:nil forState:UIControlStateNormal];
    UIBarButtonItem *nullItem = [[UIBarButtonItem alloc] initWithCustomView:nullBtn];
    
    NSArray *itemsArr = @[set,nullItem,refresh];
    self.navigationItem.rightBarButtonItems = itemsArr;
    
    
    /**
     写文字
     */
    UIButton *textBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_H - 44, SCREEN_W / 3, 44)];
    
    textBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"trip_edit_toolbar_add_text"]];
    
    [textBtn setImage:[UIImage imageNamed:@"trip_edit_toolbar_add_text"] forState:UIControlStateNormal];
    [textBtn setImage:[UIImage imageNamed:@"trip_edit_toolbar_add_text"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:textBtn];
    
    
    /**
     传照片
     */
    UIButton *photoBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W / 3 , SCREEN_H - 44, SCREEN_W / 3, 44)];
    
    photoBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"trip_edit_toolbar_add_photo"]];
    
    [photoBtn setImage:[UIImage imageNamed:@"trip_edit_toolbar_add_photo"] forState:UIControlStateNormal];
    [photoBtn setImage:[UIImage imageNamed:@"trip_edit_toolbar_add_photo"] forState:UIControlStateHighlighted];

    
    [self.view addSubview:photoBtn];
    
    
    /**
     写点评
     */
    UIButton *commentsBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W / 3 * 2 , SCREEN_H - 44, SCREEN_W / 3 , 44)];
    
    commentsBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"trip_edit_toolbar_add_comments"]];
    
    [commentsBtn setImage:[UIImage imageNamed:@"trip_edit_toolbar_add_comments"] forState:UIControlStateNormal];
    [commentsBtn setImage:[UIImage imageNamed:@"trip_edit_toolbar_add_comments"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:commentsBtn];
    
    
    /**
      scrollView
     */
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, -SCREEN_H * 0.25, SCREEN_W, SCREEN_H * 1.25 - 44)];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(0, 800);
    [self.view addSubview:scrollView];
    
    scrollView.delegate = self;
    
    
    /**
      背景图
     */
    _bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H * 0.7)];
    UIImage *bgImg = [UIImage imageNamed:@"trip_edit_cover_default"];
    _bgImageView.image = bgImg;
    
    [scrollView addSubview:_bgImageView];

    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H * 0.7)];
    bgView.backgroundColor = [UIColor grayColor];
    bgView.alpha = 0.25;
    
    [scrollView addSubview:bgView];
    
    
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_H *0.55, SCREEN_W, SCREEN_H * 0.15)];
    myImageView.image = [UIImage imageNamed:@"photo_gallery_cover"];
    
    [scrollView addSubview:myImageView];
    
    
    /**
     个人信息及日期展示
     */
    //游记名称
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_W * 0.25, SCREEN_H * 0.59, SCREEN_W * 0.5, SCREEN_H * 0.05)];
    textField.text = @"旅途";
    textField.placeholder = @"旅程";
    textField.textColor = [UIColor whiteColor];
    [scrollView addSubview:textField];
    
    //日期
    UILabel *dateLbl = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_W * 0.25, SCREEN_H * 0.64, SCREEN_W * 0.2, SCREEN_H * 0.03)];
    dateLbl.text = @"2015.10.29";
    dateLbl.font = [UIFont systemFontOfSize:11];
    dateLbl.textColor = [UIColor whiteColor];
    [scrollView addSubview:dateLbl];
    
    //头像
    UIImageView *headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, SCREEN_H * 0.59, SCREEN_W * 0.14, SCREEN_W * 0.14)];
    headImageView.layer.masksToBounds = YES;
    headImageView.layer.cornerRadius = SCREEN_W * 0.07;
    headImageView.image = [UIImage imageNamed:@"head"];
    
    [scrollView addSubview:headImageView];
    
    
    [self initMapView];
    
}


#pragma mark MAMapViewDelegate

//- (MAOverlayView *)mapView:(MAMapView *)mapView viewForOverlay:(id<MAOverlay>)overlay
//{
//    //    if (overlay == mapView.userLocationAccuracyCircle) {
//    //        MACircleView *accuracyCircleView = [[MACircleView alloc]initWithCircle:overlay];
//    //
//    //        accuracyCircleView.lineWidth = 2.f;
//    //        accuracyCircleView.strokeColor = [UIColor blueColor];
//    //        //accuracyCircleView.fillColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.0];
//    //        accuracyCircleView.fillColor = [UIColor redColor];
//    //
//    //        return accuracyCircleView;
//    //
//    //    }
//    
//    return nil;
//}


#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}


#pragma mark Button Action
/**
 *  导航栏左侧按钮点击的响应事件
 */
- (void)goback
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = YES;
}

/**
 *  导航栏右侧按钮点击的响应事件
 */
- (void)refresh
{
    NSLog(@"%@",[[NSBundle mainBundle]bundleIdentifier]);
}

- (void)set
{
    //弹框提示
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"预览游记" otherButtonTitles:@"游记设置",@"删除游记", nil];
    
    actionSheet.destructiveButtonIndex  = 2; //指定一个销毁按钮使其以红色高亮显示
    
    [actionSheet showInView:self.view];
}


/**
 *  mapBtn按钮点击的响应事件
 */
- (void)toMap
{
    MaMapViewController *MaMapVC = [[MaMapViewController alloc]initWithNibName:@"MaMapViewController" bundle:nil];
    
    [self.navigationController pushViewController:MaMapVC animated:YES];
    
}


#pragma mark UIActionSheetDelegate

/**
 *  点击按钮时触发的方法
 */
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"1111");
    }else if (buttonIndex == 1) {
        NSLog(@"2222");
    }else if (buttonIndex == 2) {
        NSLog(@"3333");
    }
}


@end
