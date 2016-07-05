//
//  AllThingViewController.m
//  BreadJourney
//
//  Created by administrator on 15/11/3.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "AllThingViewController.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"

#define MAINSIZE_H [[UIScreen mainScreen] bounds].size.height //屏幕的高
#define MAINSIZE_W [[UIScreen mainScreen] bounds].size.width   //屏幕的宽
@interface AllThingViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation AllThingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    
        self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, MAINSIZE_W, MAINSIZE_H)];
        self.webView.delegate = self;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://web.breadtrip.com/%@",self.spoy_id]]];

        [self.view addSubview:self.webView];
        [self.webView loadRequest:request];
    
    //自定义左侧按钮
    
    [self.navigationItem setHidesBackButton:YES];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"img_back_white_normal"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0 , 20, 20);
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = back;

  
}

- (void)goBack {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
