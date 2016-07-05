//
//  AboutScorllViewController.m
//  BreadJourney
//
//  Created by administrator on 15/10/30.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "AboutScorllViewController.h"


#define MAINSIZE_H [[UIScreen mainScreen] bounds].size.height //屏幕的高
#define MAINSIZE_W [[UIScreen mainScreen] bounds].size.width   //屏幕的宽

@interface AboutScorllViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;
@end

@implementation AboutScorllViewController

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
    

}

- (void)didReceiveMemoryWarning {

}

- (void)addWebView:(NSString *)urlStr {

    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0 , MAINSIZE_W, MAINSIZE_H)];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    [self.view addSubview:self.webView];

    [self.webView loadRequest:request];
    


}


- (void)goBack {

    [self.navigationController popViewControllerAnimated:YES];
    
}

//- (void)webViewDidStartLoad:(UIWebView *)webView {
//
//    UIImageView *cloud1 = [[UIImageView alloc] initWithFrame:CGRectMake((MAINSIZE_W - 80) / 2, (MAINSIZE_H - 30) / 2, 40, 30)];
//    cloud1.image = [UIImage imageNamed:@"cloud"];
//    
//    UIImageView *cloud2 = [[UIImageView alloc] initWithFrame:CGRectMake((MAINSIZE_W - 80) / 2 + 20, (MAINSIZE_H - 20) / 2, 40, 30)];
//    cloud2.image = [UIImage imageNamed:@"cloud"];
//
//    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
//    animation1.fromValue = [NSNumber numberWithFloat:(MAINSIZE_W - 80) / 2];
//    animation1.toValue = [NSNumber numberWithFloat:(MAINSIZE_W - 40) / 2];
//    animation1.duration = 0.5;
//    [cloud1.layer addAnimation:animation1 forKey:@"animation1"];
//    
//    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
//    animation2.fromValue = [NSNumber numberWithFloat:(MAINSIZE_W - 80) / 2 + 20];
//    animation2.toValue = [NSNumber numberWithFloat:(MAINSIZE_W - 80) / 2];
//    animation2.duration = 0.5;
//    [cloud1.layer addAnimation:animation2 forKey:@"animation2"];
//
//    [self.view addSubview:cloud1];
//    [self.view addSubview:cloud2];
//    
//
//}












@end
