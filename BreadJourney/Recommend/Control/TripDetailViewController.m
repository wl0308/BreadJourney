//
//  TripDetailViewController.m
//  BreadJourney
//
//  Created by administrator on 15/11/3.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "TripDetailViewController.h"
#define MAINSIZE_H [[UIScreen mainScreen] bounds].size.height //屏幕的高
#define MAINSIZE_W [[UIScreen mainScreen] bounds].size.width   //屏幕的宽

@interface TripDetailViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;
@end

@implementation TripDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.webView.delegate = self;
    
    //自定义左侧按钮
    
    [self.navigationItem setHidesBackButton:YES];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"img_back_white_normal"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0 , 20, 20);
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = back;
    
    self.view.backgroundColor = [UIColor colorWithRed:250.0 / 255.0f green:246.0 / 255.0f blue:232.0 / 255.0f alpha:0.5];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, MAINSIZE_W, MAINSIZE_H)];

    NSString *str = [NSString stringWithFormat:@"http://web.breadtrip.com/trips/%@/",self.trip_id];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:request];
    

   
}

- (void)goBack {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
