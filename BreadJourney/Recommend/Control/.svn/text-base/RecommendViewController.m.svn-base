//
//  RecommendViewController.m
//  面包旅行
//
//  Created by administrator on 15/10/25.
//  Copyright (c) 2015年 administrator. All rights reserved.
//

#import "RecommendViewController.h"
#import "AboveUpViewController.h"
#import "AboutStory.h"
#import "AboutStoryView.h"
#import "AboutTrip.h"
#import "MJRefresh.h"
#import "AboutScorllViewController.h"
#import "WaterFallViewController.h"
#import "ScrollImage.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "NearbyViewController.h"
#import "UIImageView+WebCache.h"
#import "TripDetailViewController.h"
#import "StoryDetailViewController.h"


#define NAVSIZE_H self.navigationController.navigationBar.frame.size.height  //导航栏的高
#define NAVSIZE_W self.navigationController.navigationBar.frame.size.width   //导航栏的宽

@interface RecommendViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource> {
    
    BOOL isDeceleration;
    
}

@property (nonatomic,strong) AboveUpViewController *aboveView;
@property (nonatomic,strong) UITextField * searchText;
@property (nonatomic,assign) BOOL flag;
@property (nonatomic,strong) NSMutableArray *storyArr;
@property (nonatomic,strong) NSMutableArray *tripArr;
@property (nonatomic,strong) NSMutableArray *imageArr;
@property (nonatomic,strong) AboutStoryView *view1;
@property (nonatomic,strong) AboutStoryView *view2;
@property (nonatomic,strong) AboutStoryView *view3;
@property (nonatomic,strong) AboutStoryView *view4;

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    
     self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, NAVSIZE_W, [[UIScreen mainScreen] bounds].size.height)];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.backgroundColor = [UIColor colorWithRed:250.0 / 255.0f green:243.0 / 255.0f blue:227.0 / 255.0f alpha:0.5];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)]; //下拉刷新
    self.myTableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)]; //上拉加载

    [self.view addSubview:self.myTableView];
    self.flag = YES;
    [super viewDidLoad];
    //导航栏添加背景
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"account_uploadavatar_btn"] forBarMetrics:UIBarMetricsDefault];
    
    //自定义搜索栏
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"auth_confirm_button_bg"]];
    imgView.frame = CGRectMake(10, 27, NAVSIZE_W - 80, NAVSIZE_H - 14);
    self.navigationItem.titleView = imgView;
    
    self.searchText = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, NAVSIZE_W - 90, NAVSIZE_H - 14)];
    self.searchText.textColor = [UIColor whiteColor];
    self.searchText.font = [UIFont systemFontOfSize:14];
    
   self.searchText.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UIColor *color = [UIColor whiteColor];
    self.searchText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索目的地、游记..." attributes:@{NSForegroundColorAttributeName: color}];
    
    [self.searchText addTarget:self action:@selector(popView:) forControlEvents:UIControlEventAllTouchEvents];//搜索框添加事件
    
    [imgView addSubview:self.searchText];
    imgView.userInteractionEnabled = YES;
    
   //自定义右边的按钮
    
    UIButton *nearbyBtn = [[UIButton alloc] initWithFrame:CGRectMake(NAVSIZE_W - 45, 25, 40, NAVSIZE_H - 14)];
    [nearbyBtn setTitle:@"附近" forState:UIControlStateNormal];
    nearbyBtn.titleLabel.textColor = [UIColor whiteColor];
    nearbyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [nearbyBtn addTarget:self action:@selector(nearbyThings) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *nearbyItem = [[UIBarButtonItem alloc] initWithCustomView:nearbyBtn];
    
    self.navigationItem.rightBarButtonItem = nearbyItem;

    
    self.myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, NAVSIZE_W, [[UIScreen mainScreen] bounds].size.height / 3 - 20)];
    self.myScrollView.contentSize = CGSizeMake(self.myScrollView.frame.size.width * ([self.imageArray count] + 2), self.myScrollView.frame.size.height);
    
    self.myScrollView.delegate = self;
    self.myScrollView.bounces = YES;
    self.myScrollView.pagingEnabled = YES;
    self.myScrollView.userInteractionEnabled = YES;
    
    
    self.myTableView.tableHeaderView = self.myScrollView;
    self.myTableView.tableHeaderView.userInteractionEnabled = YES;
    
    
    [self imageArr];
    
    //加入定时器
    
    self.time = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(pageChange) userInfo:nil repeats:YES];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self storyArr];
    
}

//定义四个view
- (void)reloadView {

    
    //   添加自定义的四个view
    
    self.view1 = [[AboutStoryView alloc] initWithFrame:CGRectMake(8, 5,([[UIScreen mainScreen] bounds].size.width - 24) /2, [[UIScreen mainScreen] bounds].size.height / 3)];
    
    [self.view1 addViewToView:[self.storyArr objectAtIndex:0]];
    
    
    self.view2 = [[AboutStoryView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width - 24) /2 + 16, 5, ([[UIScreen mainScreen] bounds].size.width - 24) /2, [[UIScreen mainScreen] bounds].size.height / 3)];
    
    [self.view2 addViewToView:[self.storyArr objectAtIndex:1]];

    
    self.view3 = [[AboutStoryView alloc]initWithFrame:CGRectMake(8, [[UIScreen mainScreen] bounds].size.height / 3 + 15, ([[UIScreen mainScreen] bounds].size.width - 24) /2, [[UIScreen mainScreen] bounds].size.height / 3)];
    
    [self.view3 addViewToView:[self.storyArr objectAtIndex:2]];

    
    self.view4 = [[AboutStoryView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width - 24) /2 + 16,[[UIScreen mainScreen] bounds].size.height / 3 + 15, ([[UIScreen mainScreen] bounds].size.width - 24) /2, [[UIScreen mainScreen] bounds].size.height / 3)];
    
    [self.view4 addViewToView:[self.storyArr objectAtIndex:3]];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadStoryDetail:)];
    [self.view1 addGestureRecognizer:tap1];
    UIView *tapView1 = [tap1 view];
    tapView1.tag = 0;
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadStoryDetail:)];
    [self.view2 addGestureRecognizer:tap2];
    UIView *tapView2 = [tap2 view];
    tapView2.tag = 1;
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadStoryDetail:)];
    [self.view3 addGestureRecognizer:tap3];
    UIView *tapView3 = [tap3 view];
    tapView3.tag = 2;
    
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadStoryDetail:)];
    [self.view4 addGestureRecognizer:tap4];
    UIView *tapView4 = [tap4 view];
    tapView4.tag = 3;

    self.view1.userInteractionEnabled = YES;
    self.view2.userInteractionEnabled = YES;
    self.view3.userInteractionEnabled = YES;
    self.view4.userInteractionEnabled = YES;
}
- (void)loadStoryDetail:(UIGestureRecognizer *)tap {
    
    AboutStory *story = [self.storyArr objectAtIndex:[tap view].tag];
    
    StoryDetailViewController *storyDetailVC = [[StoryDetailViewController alloc] initWithNibName:@"StoryDetailViewController" bundle:nil];
    storyDetailVC.spoy_id = story.spot_id;
    [self.navigationController pushViewController:storyDetailVC animated:YES];
  
}



//加载scrollview
- (void)reloadScrollView {
    
    //把最后一张图片放在首页的位置
    self.imageArray = [NSMutableArray array];

    for (int i = 0; i < [self.imageArr count]; i++) {
        
        ScrollImage *scrollImage = [self.imageArr objectAtIndex:i];
        UIImageView *imgview = [[UIImageView alloc] init];
       
        [imgview sd_setImageWithURL:[NSURL URLWithString:scrollImage.image_url] placeholderImage:[UIImage imageNamed:@"cloud.jpg"]];
        [self.imageArray addObject:imgview];
        NSLog(@"================%@",scrollImage.image_url);
        
    }
    UIImageView *scrollImgView = [self.imageArray objectAtIndex:[self.imageArray count] - 1];
     scrollImgView.frame = CGRectMake(self.myScrollView.frame.size.width * 0, self.myScrollView.frame.origin.y, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height);
   
    
    [self.myScrollView addSubview:scrollImgView];
    
    //把第一张图放在最后的位置
    
    UIImageView *imgViewLast = [self.imageArray objectAtIndex:0];
    imgViewLast.frame = CGRectMake(self.myScrollView.frame.size.width * ([self.imageArray count] + 1), self.myScrollView.frame.origin.y, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height);

    [self.myScrollView addSubview:imgViewLast];
    
    [self.myScrollView setContentOffset:CGPointMake(0, 0)];
    [self.myScrollView scrollRectToVisible:CGRectMake(self.myScrollView.frame.size.width, self.myScrollView.frame.origin.y, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height) animated:NO];
    
    //与pagecontrol结合使用
    
    self.myPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(NAVSIZE_W / 2 - 45,[[UIScreen mainScreen] bounds].size.height / 3 - 40, 100, 30)];
    self.myPageControl.currentPage =0;
    self.myPageControl.numberOfPages = [self.imageArray count];
    
    [self.myTableView addSubview:self.myPageControl];
    //从第一张开始加
    
    for (int i = 0; i < [self.imageArray count]; i++) {
        
        UIImageView *imgView1 = [self.imageArray objectAtIndex:i];
        imgView1.frame = CGRectMake(self.myScrollView.frame.size.width * (i + 1), self.myScrollView.frame.origin.y, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height);
        imgView1.userInteractionEnabled = YES;
        
        //点击图片
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadWeb:)];
        [imgView1 addGestureRecognizer:tap];
        UIView *tapView = [tap view];
        tapView.tag = i;
        [self.myScrollView addSubview:imgView1];
        
    }
}

- (NSMutableArray *)imageArr {
    if (_imageArr == nil) {

    _imageArr = [NSMutableArray array];
    
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    
    [mgr GET: @"http://api.breadtrip.com/v2/index/?lat=31.27653555377953&lng=120.73958818074&sign=2d4473ed45098501475daa1acd79991f" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dict1 = [dict valueForKey:@"data"];
        NSArray *arr = [dict1 valueForKey:@"elements"];
        NSDictionary *dict2 = [arr objectAtIndex:0];
        NSArray *arr1 = [dict2 valueForKey:@"data"];
        NSArray *dataArr = [arr1 objectAtIndex:0];

        for (NSDictionary *dict in dataArr) {
            
            NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
            [dict3 setValue:[dict objectForKey:@"image_url"] forKey:@"image_url"];
            [dict3 setValue:[dict objectForKey:@"html_url"] forKey:@"html_url"];
            
            ScrollImage *scrollImage = [ScrollImage ScrollWithDictionary:dict3];
            
            [_imageArr addObject:scrollImage];
         
            
        }
        
        [self reloadScrollView];
        [self.myTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
        
    }

       return _imageArr;
}

- (void)loadWeb:(UITapGestureRecognizer *)tap {
    
    
    
    AboutScorllViewController *aboutScorllVC = [[AboutScorllViewController alloc] init];

    ScrollImage *scrollImage = [self.imageArr objectAtIndex:[tap view].tag];
    
    [aboutScorllVC addWebView:scrollImage.html_url];
    
    [self.navigationController pushViewController:aboutScorllVC animated:YES];
    
}


//刷新事件

- (void)loadNewData {

   NSTimer *mytimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(stopLoad) userInfo:nil repeats:NO];
    
}
- (void)stopLoad {
    
    self.tripArr = [NSMutableArray array];
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    
    [mgr GET: @"http://api.breadtrip.com/v2/index/?lat=31.27653555377953&lng=120.73958818074&sign=2d4473ed45098501475daa1acd79991f" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dict1 = [dict valueForKey:@"data"];
        NSArray *arr = [dict1 valueForKey:@"elements"];
        NSMutableArray *arr1 = [NSMutableArray array];
        NSMutableArray *arr2 = [NSMutableArray array];
        for (int i = 7; i < arr.count; i++) {
            
            [arr1 addObject:[arr objectAtIndex:i]];
            
        }
        for (NSDictionary *dict2 in arr1) {
            
            NSArray * dataArr = [dict2 valueForKey:@"data"];
            NSDictionary *dict3 = [dataArr objectAtIndex:0];
            NSDictionary *dict5 = [dict3 valueForKey:@"user"];
            
            NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
            [dict4 setValue:[dict3 valueForKey:@"cover_image_w640"] forKey:@"cover_image"];
            [dict4 setValue:[dict3 valueForKey:@"name"] forKey:@"name"];
            [dict4 setValue:[dict3 valueForKey:@"first_day"] forKey:@"starttime"];
            [dict4 setValue:[dict3 valueForKey:@"day_count"] forKey:@"day_count"];
            [dict4 setValue:[dict3 valueForKey:@"view_count"] forKey:@"view_count"];
            [dict4 setValue:[dict3 valueForKey:@"popular_place_str"] forKey:@"location"];
            [dict4 setValue:[dict5 valueForKey:@"avatar_m"] forKey:@"head_image"];
            [dict4 setValue:[dict5 valueForKey:@"name"] forKey:@"user_name"];
            [dict4 setValue:[dict3 valueForKey:@"id"] forKey:@"trip_id"];
            
            AboutTrip *trip = [AboutTrip TripWithDictionary:dict4];
            if (trip.name != nil) {
                
                
                [self.tripArr addObject:trip];
                
            }
            
            
        }
        
        for (int i = 2; i < 6; i++) {
            
            [arr2 addObject:[arr objectAtIndex:i]];
            
        }
        for (NSDictionary *dict2 in arr2) {
            
            NSArray * dataArr = [dict2 valueForKey:@"data"];
            NSDictionary *dict3 = [dataArr objectAtIndex:0];
            NSDictionary *dict5 = [dict3 valueForKey:@"user"];
            
            NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
            [dict4 setValue:[dict3 valueForKey:@"index_cover"] forKey:@"storyimage"];
            [dict4 setValue:[dict5 valueForKey:@"avatar_m"] forKey:@"headimage"];
            
            [dict4 setValue:[dict3 valueForKey:@"index_title"] forKey:@"aboutstory"];
            [dict4 setValue:[dict5 valueForKey:@"name"] forKey:@"username"];
            [dict4 setValue:[dict3 valueForKey:@"spot_id"] forKey:@"spot_id"];
            
            
            AboutStory *story = [AboutStory StoryWithDictionary:dict4];
            
            [self.storyArr addObject:story];
            
            
        }
        
        [self reloadView];

        
        [self.myTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];


    [self.myTableView.header endRefreshing];
    
}

// 上拉

- (void)loadMoreData {

    
    NSTimer *mytimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(stopLoadData) userInfo:nil repeats:NO];
    
    
}


- (void)stopLoadData {


    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    
    NSString *str;
    if (self.tripArr.count <= 18) {
       str = @"http://api.breadtrip.com/v2/index/?lat=31.27652707067311&lng=120.739598153591&next_start=2387121039&sign=38b404f506b7acd8b7c35881f870e704";
    }
    else if ((self.tripArr.count > 18) && (self.tripArr.count <= 28)) {
    
        str = @"http://api.breadtrip.com/v2/index/?lat=31.27652707067311&lng=120.739598153591&next_start=2388212651&sign=d73d5eec1b572924dcfb7a17bb22ff8b";
    }
    
    else if ((self.tripArr.count > 28) && (self.tripArr.count <= 38)) {
        
        str = @"http://api.breadtrip.com/v2/index/?lat=31.27652707067311&lng=120.739598153591&next_start=2387637893&sign=ff3daa5e014a79dc061922babd46c4ee";
    }
    
    else if ((self.tripArr.count > 38) && (self.tripArr.count <= 48)) {
        
        str = @"http://api.breadtrip.com/v2/index/?lat=31.27652707067311&lng=120.739598153591&next_start=2387675010&sign=77c6b99937188368cf5dbdd940822a48";
    }
    
    else
        
    {
    
          [self.myTableView.footer endRefreshing];
        
    }
    
    [mgr GET: str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dict1 = [dict valueForKey:@"data"];
        NSArray *arr = [dict1 valueForKey:@"elements"];
       
        for (NSDictionary *dict2 in arr) {
            
            NSArray * dataArr = [dict2 valueForKey:@"data"];
            NSDictionary *dict3 = [dataArr objectAtIndex:0];
            NSDictionary *dict5 = [dict3 valueForKey:@"user"];
            
            NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
            [dict4 setValue:[dict3 valueForKey:@"cover_image_w640"] forKey:@"cover_image"];
            [dict4 setValue:[dict3 valueForKey:@"name"] forKey:@"name"];
            [dict4 setValue:[dict3 valueForKey:@"first_day"] forKey:@"starttime"];
            [dict4 setValue:[dict3 valueForKey:@"day_count"] forKey:@"day_count"];
            [dict4 setValue:[dict3 valueForKey:@"view_count"] forKey:@"view_count"];
            [dict4 setValue:[dict3 valueForKey:@"popular_place_str"] forKey:@"location"];
            [dict4 setValue:[dict5 valueForKey:@"avatar_m"] forKey:@"head_image"];
            [dict4 setValue:[dict5 valueForKey:@"name"] forKey:@"user_name"];
            [dict4 setValue:[dict3 valueForKey:@"id"] forKey:@"trip_id"];
            
            AboutTrip *trip = [AboutTrip TripWithDictionary:dict4];
            if (trip.name != nil) {
                
                
                [self.tripArr addObject:trip];
                
            }
            
            
        }
        
        
        [self.myTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];

    
    [self.myTableView.footer endRefreshing];
    
}
//搜索框事件

- (void)popView:(UITextField *)text{
    
    if (self.flag) {
       
        self.aboveView = [[AboveUpViewController alloc] initWithNibName:@"AboveUpViewController" bundle:nil];
        [self.aboveView dropDown];
        [self.view addSubview:self.aboveView.view];
        
        self.flag = NO;
        
        //自定义取消的按钮
        
        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(NAVSIZE_W - 55, 25, 40, NAVSIZE_H - 14)];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancelBtn.titleLabel.textColor = [UIColor whiteColor];
        cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
        
        self.navigationItem.rightBarButtonItem = cancelItem;
        
    }
}

//取消按钮事件

- (void)cancel {
    
    
       [self.aboveView.view removeFromSuperview];
    
        self.flag = YES;
    
        UIButton *nearbyBtn = [[UIButton alloc] initWithFrame:CGRectMake(NAVSIZE_W - 55, 25, 40, NAVSIZE_H - 14)];
        [nearbyBtn setTitle:@"附近" forState:UIControlStateNormal];
        nearbyBtn.titleLabel.textColor = [UIColor whiteColor];
        nearbyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [nearbyBtn addTarget:self action:@selector(nearbyThings) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *nearbyItem = [[UIBarButtonItem alloc] initWithCustomView:nearbyBtn];
        
    self.navigationItem.rightBarButtonItem = nearbyItem;
    
   [self.searchText endEditing:YES];
    
    
}

//定时器事件

- (void)pageChange {

    if (isDeceleration == NO) {
       
        [self.myScrollView setContentOffset:CGPointMake(self.myScrollView.contentOffset.x + NAVSIZE_W, self.myScrollView.contentOffset.y) animated:YES];
        CGFloat pageWidth = self.myScrollView.frame.size.width;
        
        int page = floor((self.myScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        self.myPageControl.currentPage = page;
        if (page ==[self.imageArray count]) {
            
            self.myPageControl.currentPage = 0; //如果到了最后一页 设置currentpage = 0 ，重新开始
            
        }
        
    }
    
}


//附近按钮事件

- (void)nearbyThings {
    
   NearbyViewController *nearByVC = [[NearbyViewController alloc] initWithNibName:@"NearbyViewController" bundle:nil];
    [self.navigationController pushViewController:nearByVC animated:YES];
    
    
}

//scrollview

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {

    isDeceleration = YES;
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    [self scrollViewDidEndDecelerating:self.myScrollView];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    isDeceleration = NO;
    
    int currentPage = floor((self.myScrollView.contentOffset.x - self.myScrollView.frame.size.width / ([self.imageArray count] + 2)) / self.myScrollView.frame.size.width) + 1;
    
    if (currentPage == 0) {
        
        [self.myScrollView scrollRectToVisible:CGRectMake(self.myScrollView.frame.size.width * [self.imageArray count], self.myScrollView.frame.origin.y
                                                          , self.myScrollView.frame.size.width, self.myScrollView.frame.size.height) animated:NO];
    }
    
    else if (currentPage == [self.imageArray count] + 1){
    
        [self.myScrollView scrollRectToVisible:CGRectMake(self.myScrollView.frame.size.width, self.myScrollView.frame.origin.y, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height) animated:NO];
        
    }
    
}

//点击空白处 键盘收回

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.searchText isExclusiveTouch]) {
        
        [self.searchText resignFirstResponder];
        
    }
    
}

//懒加载

- (NSMutableArray *)storyArr {

    if (_storyArr == nil) {
        
      _storyArr = [NSMutableArray array];
        
        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
        mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
        
        [mgr GET: @"http://api.breadtrip.com/v2/index/?lat=31.27653555377953&lng=120.73958818074&sign=2d4473ed45098501475daa1acd79991f" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *dict = (NSDictionary *)responseObject;
            NSDictionary *dict1 = [dict valueForKey:@"data"];
            NSArray *arr = [dict1 valueForKey:@"elements"];
            NSMutableArray *arr1 = [NSMutableArray array];
            for (int i = 2; i < 6; i++) {
                
                [arr1 addObject:[arr objectAtIndex:i]];
                
            }
            for (NSDictionary *dict2 in arr1) {
                
                NSArray * dataArr = [dict2 valueForKey:@"data"];
                NSDictionary *dict3 = [dataArr objectAtIndex:0];
                NSDictionary *dict5 = [dict3 valueForKey:@"user"];
                
                NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
                [dict4 setValue:[dict3 valueForKey:@"index_cover"] forKey:@"storyimage"];
                [dict4 setValue:[dict5 valueForKey:@"avatar_m"] forKey:@"headimage"];

                [dict4 setValue:[dict3 valueForKey:@"index_title"] forKey:@"aboutstory"];
                [dict4 setValue:[dict5 valueForKey:@"name"] forKey:@"username"];
                [dict4 setValue:[dict3 valueForKey:@"spot_id"] forKey:@"spot_id"];
             
                
                AboutStory *story = [AboutStory StoryWithDictionary:dict4];
       
                    [_storyArr addObject:story];
 

            }

            [self reloadView];
            [self.myTableView reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@",error);
            
        }];
        

        
    }
    
    return _storyArr;
}

//懒加载

- (NSMutableArray *)tripArr {

    if (_tripArr == nil) {
        
        _tripArr = [NSMutableArray array];
        
        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
        mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
        
        [mgr GET: @"http://api.breadtrip.com/v2/index/?lat=31.27653555377953&lng=120.73958818074&sign=2d4473ed45098501475daa1acd79991f" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *dict = (NSDictionary *)responseObject;
            NSDictionary *dict1 = [dict valueForKey:@"data"];
            NSArray *arr = [dict1 valueForKey:@"elements"];
            NSMutableArray *arr1 = [NSMutableArray array];
            for (int i = 7; i < arr.count; i++) {
                
                [arr1 addObject:[arr objectAtIndex:i]];
                
            }
            for (NSDictionary *dict2 in arr1) {
                
                NSArray * dataArr = [dict2 valueForKey:@"data"];
                NSDictionary *dict3 = [dataArr objectAtIndex:0];
                NSDictionary *dict5 = [dict3 valueForKey:@"user"];
                
                NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
                [dict4 setValue:[dict3 valueForKey:@"cover_image_w640"] forKey:@"cover_image"];
                [dict4 setValue:[dict3 valueForKey:@"name"] forKey:@"name"];
                [dict4 setValue:[dict3 valueForKey:@"first_day"] forKey:@"starttime"];
                [dict4 setValue:[dict3 valueForKey:@"day_count"] forKey:@"day_count"];
                [dict4 setValue:[dict3 valueForKey:@"view_count"] forKey:@"view_count"];
                [dict4 setValue:[dict3 valueForKey:@"popular_place_str"] forKey:@"location"];
                [dict4 setValue:[dict5 valueForKey:@"avatar_m"] forKey:@"head_image"];
                [dict4 setValue:[dict5 valueForKey:@"name"] forKey:@"user_name"];
                [dict4 setValue:[dict3 valueForKey:@"id"] forKey:@"trip_id"];
                
                AboutTrip *trip = [AboutTrip TripWithDictionary:dict4];
        if (trip.name != nil) {
                    
             
                [_tripArr addObject:trip];
                    
        }
                
           
            }
     
            
            [self.myTableView reloadData];
     
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@",error);
            
        }];
   
    }
  

    return _tripArr;
}


//cell 块数

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
    
}

//cell行数

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        
        return 1;
        
    }
    else if (section == 1) {
    
        return 1;
        
    }
    
    else if (section == 2) {
    
        return 1;
    }
    else
        
    {
    
        return self.tripArr.count;
    }

 
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = self.myTableView.backgroundColor = [UIColor colorWithRed:250.0 / 255.0f green:243.0 / 255.0f blue:227.0 / 255.0f alpha:0.5];
    
    //cell重用移除之前的view
    
    NSArray *viewArr = cell.contentView.subviews;
    for (UIView *view in viewArr) {
        
        [view removeFromSuperview];
        
    }
    
    if (indexPath.section == 0) {
        
        UIImageView *blueImgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8 , 5, 18)];
        blueImgView.image = [UIImage imageNamed:@"im_featured_item_shu_line"];
        [cell.contentView addSubview:blueImgView];
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(25,3, 150, 30)];
        titleLab.font = [UIFont systemFontOfSize:16];
        titleLab.text =@"每日精选故事";
        [cell.contentView addSubview:titleLab];
        UIImageView *leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(NAVSIZE_W - 15, 10 , 10, 18)];
        leftImgView.image = [UIImage imageNamed:@"auth_login_register_indicator"];
        [cell.contentView addSubview:leftImgView];
        
        UIButton *allBtn = [[UIButton alloc] initWithFrame:CGRectMake(NAVSIZE_W - 60, 4, 45, 30)];
        
        [allBtn setTitle:@"全部" forState:UIControlStateNormal];
        [allBtn setTitleColor:[UIColor colorWithRed:135.0 / 255.0f green:135.0 / 255.0f blue:135.0 / 255.0f alpha:0.5] forState:UIControlStateNormal];
        allBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [allBtn addTarget:self action:@selector(allThings) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.contentView addSubview:allBtn];
        cell.userInteractionEnabled = YES;
        allBtn.userInteractionEnabled = YES;
        
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:249.0 / 255.0f green:241.0 / 255.0f blue:219.0 / 255.0f alpha:0.5];
        
      
    
    }
    
    else if (indexPath.section == 1) {
        
          cell.userInteractionEnabled = YES;
        [cell.contentView addSubview:self.view1];
         [cell.contentView addSubview:self.view2];
         [cell.contentView addSubview:self.view3];
         [cell.contentView addSubview:self.view4];
        
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:249.0 / 255.0f green:241.0 / 255.0f blue:219.0 / 255.0f alpha:0.5];

        
    }
    
    else if (indexPath.section == 2){
    

        UIImageView *blueImgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 6 , 5, 18)];
        blueImgView.image = [UIImage imageNamed:@"im_featured_item_shu_line"];
        [cell.contentView addSubview:blueImgView];
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(25,0, 150, 30)];
        titleLab.font = [UIFont systemFontOfSize:16];
        titleLab.text =@"精彩游记和专题";
        [cell.contentView addSubview:titleLab];
        
        cell.userInteractionEnabled = NO;
        
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:249.0 / 255.0f green:241.0 / 255.0f blue:219.0 / 255.0f alpha:0.5];
        
    }
    else
        
    {
    
        cell.userInteractionEnabled = YES;
        AboutTrip *trip = [self.tripArr objectAtIndex:indexPath.row];
        
        UIImageView *tripImgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 0, NAVSIZE_W - 16, 180)];
        [tripImgView sd_setImageWithURL:[NSURL URLWithString:trip.cover_image] placeholderImage:[UIImage imageNamed:@"cloud.jpg"]];
        
        tripImgView.layer.cornerRadius = 3.0;
        tripImgView.layer.masksToBounds = YES;
        [cell.contentView addSubview:tripImgView];
        
        UILabel *tripTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(18, 5, 300, 30)];
        tripTitleLab.text = trip.name;
        tripTitleLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
        tripTitleLab.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:tripTitleLab];
        
            UIImageView *blueImgView = [[UIImageView alloc] initWithFrame:CGRectMake(22, 33, 3, 22)];
            blueImgView.image = [UIImage imageNamed:@"im_featured_item_shu_line"];
            [cell.contentView addSubview:blueImgView];
 
        UILabel *tripTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(28, 29, 200, 15)];
        NSString *str = trip.starttime;
        NSString *str1 = [str stringByAppendingString:[NSString stringWithFormat:@"  %@天",trip.day_count]];
        NSString *str2 = [str1 stringByAppendingString:[NSString stringWithFormat:@"  %@次浏览",trip.view_count]];
        tripTimeLab.text = str2;
        tripTimeLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        tripTimeLab.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:tripTimeLab];
        
        UILabel *tripLocationLab = [[UILabel alloc] initWithFrame:CGRectMake(28, 43, 200, 15)];
        tripLocationLab.text = trip.location;
        tripLocationLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
        tripLocationLab.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:tripLocationLab];

        UIImageView *tripHeadImgView = [[UIImageView alloc] initWithFrame:CGRectMake(22, 135, 30, 30)];
        [tripHeadImgView sd_setImageWithURL:[NSURL URLWithString:trip.head_image] placeholderImage:[UIImage imageNamed:@"cloud"]];
        tripHeadImgView.layer.cornerRadius = 15.0;
        tripHeadImgView.layer.masksToBounds = YES;
        [cell.contentView addSubview:tripHeadImgView];
        
        UILabel *tripNameLab = [[UILabel alloc] initWithFrame:CGRectMake(58, 135, 300, 30)];
        tripNameLab.text = trip.user_name;
        tripNameLab.textColor = [UIColor whiteColor];
        tripNameLab.font = [UIFont systemFontOfSize:12];
        [cell.contentView addSubview:tripNameLab];
        
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:249.0 / 255.0f green:241.0 / 255.0f blue:219.0 / 255.0f alpha:0.5];
        
       
        
        
    }
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        if (indexPath.section == 0 ) {
    
            return 35;
    
        }
        else if (indexPath.section == 1) {
    
            return [[UIScreen mainScreen] bounds].size.height / 3 * 2 + 20;
    
        }
    
        else if (indexPath.section == 2) {
            
            return 35;
            
        }
        else {
    
            return 190;
        }

}

- (void)allThings {

    WaterFallViewController *waterFallVC = [[WaterFallViewController alloc] initWithNibName:@"WaterFallViewController" bundle:nil];
    
    [self.navigationController pushViewController:waterFallVC animated:YES];
    
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 3) {

    AboutTrip *trip = [self.tripArr objectAtIndex:indexPath.row];
    TripDetailViewController *tripDetailVC = [[TripDetailViewController alloc] initWithNibName:@"TripDetailViewController" bundle:nil];
    tripDetailVC.trip_id = trip.trip_id;
    [self.navigationController pushViewController:tripDetailVC animated:YES];
        
    }
}















@end
