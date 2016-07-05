//
//  StoryDetailViewController.m
//  BreadJourney
//
//  Created by administrator on 15/11/3.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "StoryDetailViewController.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"

#define MAINSIZE_H [[UIScreen mainScreen] bounds].size.height //屏幕的高
#define MAINSIZE_W [[UIScreen mainScreen] bounds].size.width   //屏幕的宽

@interface StoryDetailViewController ()<UIWebViewDelegate>
@property (nonatomic,copy) NSString *storyUrl;
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation StoryDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    NSString *str = [NSString stringWithFormat:@"http://api.breadtrip.com/v2/new_trip/spot/?spot_id=%@",self.spoy_id];
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    [mgr GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dict1 = [dict valueForKey:@"data"];
        NSDictionary *dict2 = [dict1 valueForKey:@"spot"];
        NSString *str = [dict2 valueForKey:@"share_url"];
        self.storyUrl = [NSString stringWithFormat:@"http://web.breadtrip.com/%@",str];
        
     
        self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, MAINSIZE_W, MAINSIZE_H)];
          self.webView.delegate = self;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.storyUrl]];
        [self.view addSubview:self.webView];
        [self.webView loadRequest:request];
        
        
     
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
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
