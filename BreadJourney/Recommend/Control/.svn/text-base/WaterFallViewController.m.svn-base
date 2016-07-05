//
//  WaterFallViewController.m
//  BreadJourney
//
//  Created by administrator on 15/10/30.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "WaterFallViewController.h"
#import "WaterFall.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"
#import "AllThingViewController.h"


#define NAVSIZE_H self.navigationController.navigationBar.frame.size.height  //导航栏的高
#define NAVSIZE_W self.navigationController.navigationBar.frame.size.width   //导航栏的宽

static NSString *identifier = @"collectionView";
@interface WaterFallViewController ()

@property (nonatomic,strong) NSMutableArray *WaterArr;


@end

@implementation WaterFallViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView = [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor colorWithRed:249.0 / 255.0f green:241 / 255.0f blue:219 / 255.0f alpha:0.5];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];

     [self.view addSubview:self.collectionView];
    
    //自定义左侧按钮
    
    [self.navigationItem setHidesBackButton:YES];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"img_back_white_normal"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0 , 20, 20);
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = back;
    
    //自定义导航栏title
    
    float xPoint = (NAVSIZE_H - 20) / 2;
    float yPoint = (NAVSIZE_W - 20) / 2;
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(xPoint, yPoint, 20, 20)];
    titleLab.text = @"精选故事";
    titleLab.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLab;

    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];//下拉刷新
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)]; //上拉加载
    
    
    
}

// 下拉刷新

- (void)loadNewData {


    //计时器  上拉加载延迟显示
    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(stopData) userInfo:nil repeats:NO];
}

- (void)stopData {
    
    
    self.WaterArr = [NSMutableArray array];
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    
    [mgr GET:@"http://api.breadtrip.com/v2/new_trip/spot/hot/list/?start=0" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dict1 = [dict valueForKey:@"data"];
        NSArray *dataArr = [dict1 valueForKey:@"hot_spot_list"];
        
        
        for (NSDictionary *dict in dataArr) {
            
            NSDictionary *userDict = [dict valueForKey:@"user"];
            NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
            [dataDict setObject:[dict valueForKey:@"index_cover"] forKey:@"index_cover"];
            [dataDict setObject:[userDict valueForKey:@"avatar_m"] forKey:@"avatar_m"];
            [dataDict setObject:[userDict valueForKey:@"name"] forKey:@"name"];
            [dataDict setObject:[dict valueForKey:@"index_title"] forKey:@"index_title"];
            [dataDict setObject:[dict valueForKey:@"share_url"] forKey:@"share_url"];
            
            WaterFall *waterFall  = [WaterFall WaterWithDictionary:dataDict];
            
            [self.WaterArr addObject:waterFall];
            
        }
        
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];

    [self.collectionView.header endRefreshing];
}

//上拉加载

- (void)loadMoreData {

    //计时器  上拉加载延迟显示
    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(stopLoad) userInfo:nil repeats:NO];
}

//计时器事件
- (void)stopLoad {
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    
    NSString *str = [NSString stringWithFormat:@"http://api.breadtrip.com/v2/new_trip/spot/hot/list/?start=%d",(int)self.WaterArr.count];
    
    [mgr GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dict1 = [dict valueForKey:@"data"];
        NSArray *dataArr = [dict1 valueForKey:@"hot_spot_list"];
        
        
        for (NSDictionary *dict in dataArr) {
            
            NSDictionary *userDict = [dict valueForKey:@"user"];
            NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
            [dataDict setObject:[dict valueForKey:@"index_cover"] forKey:@"index_cover"];
            [dataDict setObject:[userDict valueForKey:@"avatar_m"] forKey:@"avatar_m"];
            [dataDict setObject:[userDict valueForKey:@"name"] forKey:@"name"];
            [dataDict setObject:[dict valueForKey:@"index_title"] forKey:@"index_title"];
            [dataDict setObject:[dict valueForKey:@"share_url"] forKey:@"share_url"];
            
            WaterFall *waterFall  = [WaterFall WaterWithDictionary:dataDict];
            
            [_WaterArr addObject:waterFall];
            
        }
        
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];

    [self.collectionView.footer endRefreshing];
}
- (void)goBack {
    
    [self.navigationController popViewControllerAnimated:YES];

}

//懒加载

- (NSMutableArray *)WaterArr {

    
 if (_WaterArr == nil) {
     
     _WaterArr = [NSMutableArray array];
     
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    
    [mgr GET:@"http://api.breadtrip.com/v2/new_trip/spot/hot/list/?start=0" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dict1 = [dict valueForKey:@"data"];
        NSArray *dataArr = [dict1 valueForKey:@"hot_spot_list"];
    
   
        for (NSDictionary *dict in dataArr) {
            
            NSDictionary *userDict = [dict valueForKey:@"user"];
            NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
            [dataDict setObject:[dict valueForKey:@"index_cover"] forKey:@"index_cover"];
            [dataDict setObject:[userDict valueForKey:@"avatar_m"] forKey:@"avatar_m"];
            [dataDict setObject:[userDict valueForKey:@"name"] forKey:@"name"];
            [dataDict setObject:[dict valueForKey:@"index_title"] forKey:@"index_title"];
            [dataDict setObject:[dict valueForKey:@"share_url"] forKey:@"share_url"];
            
            WaterFall *waterFall  = [WaterFall WaterWithDictionary:dataDict];
            
            [_WaterArr addObject:waterFall];
    
        }
        
          [self.collectionView reloadData];
      
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
        NSLog(@"%@",error);
        
    }];

 }
    
    return _WaterArr;
  
}

//代理方法实现

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.WaterArr.count;


}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[UICollectionViewCell alloc] init];
        
    }
    
    NSArray *arrViews = cell.contentView.subviews;
    for (UIView *view in arrViews) {
        [view removeFromSuperview];
        
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 3.0;
    cell.layer.masksToBounds = YES;
    
    WaterFall *water = [self.WaterArr objectAtIndex:indexPath.row];
    
    UIImageView *storyImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ([[UIScreen mainScreen] bounds].size.width - 24) /2, [[UIScreen mainScreen] bounds].size.height / 15 * 3)];
    //设置图片两个圆角
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, ([[UIScreen mainScreen] bounds].size.width - 24) /2, [[UIScreen mainScreen] bounds].size.height / 15 * 3) byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(3.0, 3.0)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, ([[UIScreen mainScreen] bounds].size.width - 24) /2, [[UIScreen mainScreen] bounds].size.height / 15 * 3);
    maskLayer.path = shadowPath.CGPath;
    storyImgView.layer.mask = maskLayer;
    [storyImgView sd_setImageWithURL:[NSURL URLWithString:water.index_cover] placeholderImage:[UIImage imageNamed:@"what.jpg"]];
    [cell.contentView addSubview:storyImgView];
    
    UILabel *aboutStroyLab = [[UILabel alloc] initWithFrame:CGRectMake(10, [[UIScreen mainScreen] bounds].size.height / 15 * 3 + 5, [[UIScreen mainScreen] bounds].size.width / 2 - 25, 40)];
    aboutStroyLab.text = water.index_title;
    
    //自动换行
    [aboutStroyLab setNumberOfLines:0];
    UIFont *font = [UIFont systemFontOfSize:12];
    aboutStroyLab.font = font;

    
    [cell.contentView addSubview:aboutStroyLab];
    
    UIImageView *headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, [[UIScreen mainScreen] bounds].size.height / 15 * 3 + 45, 20, 20)];
    
    headImgView.layer.cornerRadius = 10.0;
    headImgView.layer.masksToBounds = YES;
    [headImgView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",water.avatar_m]]];
    
    [cell.contentView addSubview:headImgView];
    
    UILabel *usernameLab = [[UILabel alloc] initWithFrame:CGRectMake(40, [[UIScreen mainScreen] bounds].size.height / 15 * 3 + 45, 200, 20)];
    usernameLab.text = water.name;
    usernameLab.textColor = [UIColor colorWithRed:5.0 / 255.0f green:5.0 / 255.0f blue:5.0 / 255.0f alpha:0.5];
    
    usernameLab.font = [UIFont systemFontOfSize:13];
    
    [cell.contentView addSubview:usernameLab];
    
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    float width = ([[UIScreen mainScreen] bounds].size.width - 24) / 2;
    float height = [[UIScreen mainScreen] bounds].size.height / 3;
    
    return CGSizeMake(width, height);
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    UIEdgeInsets edgeInsets = {15,6,0,6};
    return edgeInsets;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WaterFall *water = [self.WaterArr objectAtIndex:indexPath.row];
    AllThingViewController *allThingVC = [[AllThingViewController alloc] initWithNibName:@"AllThingViewController" bundle:nil];
    allThingVC.spoy_id = water.share_url;
    [self.navigationController pushViewController:allThingVC animated:YES];
    
}
@end
