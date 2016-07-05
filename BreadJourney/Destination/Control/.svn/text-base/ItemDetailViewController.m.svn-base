//
//  ItemDetailViewController.m
//  BreadJourney
//
//  Created by administrator on 10/28/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "common.h"
#import "HelloweenDetail.h"

static NSString *cellID = @"detailCell";

@interface ItemDetailViewController ()

@property (nonatomic, strong) UIImageView *myCover;
@property (nonatomic, strong) UILabel *myTitle;
@property (nonatomic, strong) UIImageView *detailicon_bg;
@property (nonatomic, strong) UIImageView *detailicon;
@property (nonatomic, strong) UIButton *photobtn;
@property (nonatomic, strong) UILabel *photolbl;

@property (nonatomic, strong) UIImageView *star1;
@property (nonatomic, strong) UIImageView *star2;
@property (nonatomic, strong) UIImageView *star3;
@property (nonatomic, strong) UIImageView *star4;
@property (nonatomic, strong) UIImageView *star5;
@property (nonatomic, strong) UILabel *suggestCount;

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) UILabel *recommend_reason;

@end

@implementation ItemDetailViewController

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


- (void)initTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,Screen_W , Screen_H)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //加载自定义导航栏
    [self initNav];
   
    //加载tableview
    [self initTableView];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 1 || section == 3) {
        return 1;
    }
    else if (section == 2) {
        return 3;
    }
    else if (section == 4)
    {
        return 5;
    }
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //cell重用移除之前的view
    
    NSArray *viewArr = cell.contentView.subviews;
    for (UIView *view in viewArr) {
        
        [view removeFromSuperview];
        
    }
    if (indexPath.section == 0) {
        
        cell.userInteractionEnabled = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        /**
         大封面和大标题
         */
        self.myCover = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 180)];
        self.myCover.image = [UIImage imageNamed:self.detailCover];
        self.myCover.userInteractionEnabled = YES;
        
        self.myTitle = [[UILabel alloc]initWithFrame:CGRectMake(30, 234, 260, 21)];
        self.myTitle.text = self.detailTitle;
        self.myTitle.font = [UIFont systemFontOfSize:24];
        self.myTitle.textAlignment = NSTextAlignmentCenter;
        
        
        /**
         照相机和照片数
         */
       self.photobtn = [[UIButton alloc]initWithFrame:CGRectMake(248, 155, 20, 20)];
        [self.photobtn setBackgroundImage:[UIImage imageNamed:@"im_photo"] forState:UIControlStateNormal];
        [self.photobtn setBackgroundImage:[UIImage imageNamed:@"img_photo"] forState:UIControlStateSelected];
        //照相机点击事件
        [self.photobtn addTarget:self action:@selector(photoAction) forControlEvents:UIControlEventTouchUpInside];
        
        self.photolbl.backgroundColor = [UIColor redColor];
        self.photolbl = [[UILabel alloc]initWithFrame:CGRectMake(273, 158, 42, 14)];
        self.photolbl.text = @"1000";
        self.photolbl.font = [UIFont systemFontOfSize:12];
        self.photolbl.textColor = [UIColor whiteColor];
        [self.myCover addSubview:self.photobtn];
        [self.myCover addSubview:self.photolbl];
        
        //添加到cell
        [cell.contentView addSubview:self.myCover];
        [cell.contentView addSubview:self.myTitle];
         
        /**
         中间的圆形图标
         */
        self.detailicon_bg = [[UIImageView alloc]initWithFrame:CGRectMake(132, 158, 56, 56)];
        self.detailicon_bg.layer.masksToBounds = YES;
        self.detailicon_bg.layer.cornerRadius = 56/2;
        self.detailicon_bg.image = [UIImage imageNamed:@"im_poidetails_sale_prodect_bg.9.9"];
        self.detailicon = [[UIImageView alloc]initWithFrame:CGRectMake(135, 161, 50, 50)];
        self.detailicon.image = [UIImage imageNamed:@"im_poi_details_type_attraction"];
        
        //添加到cell
        [cell.contentView addSubview:self.detailicon_bg];
        [cell.contentView addSubview:self.detailicon];
        
        /**
         评分星级和评分人数
         */
        self.star1 = [[UIImageView alloc]initWithFrame:CGRectMake(80, 270, 12, 12)];
        self.star1.image = [UIImage imageNamed:@"rb_destination_poi_item_press"];
        self.star2 = [[UIImageView alloc]initWithFrame:CGRectMake(97, 270, 12, 12)];
        self.star2.image = [UIImage imageNamed:@"rb_destination_poi_item_press"];
        self.star3 = [[UIImageView alloc]initWithFrame:CGRectMake(114, 270, 12, 12)];
        self.star3.image = [UIImage imageNamed:@"rb_destination_poi_item_press"];
        self.star4 = [[UIImageView alloc]initWithFrame:CGRectMake(131, 270, 12, 12)];
        self.star4.image = [UIImage imageNamed:@"rb_destination_poi_item_press"];
        self.star5 = [[UIImageView alloc]initWithFrame:CGRectMake(148, 270, 12, 12)];
        self.star5.image = [UIImage imageNamed:@"rb_destination_poi_item_half"];
        self.suggestCount = [[UILabel alloc]initWithFrame:CGRectMake(170, 268, 70, 16)];
        self.suggestCount.textColor = [UIColor grayColor];
        self.suggestCount.font = [UIFont systemFontOfSize:12];
        self.suggestCount.text = @"2用户点评";
        
        [cell.contentView addSubview:self.star1];
        [cell.contentView addSubview:self.star2];
        [cell.contentView addSubview:self.star3];
        [cell.contentView addSubview:self.star4];
        [cell.contentView addSubview:self.star5];
        [cell.contentView addSubview:self.suggestCount];
        
        /**
         推荐语
         */
        //设置推荐label自适应
        self.recommend_reason = [[UILabel alloc]initWithFrame:CGRectMake(60, 260, 200, 14)];
        self.recommend_reason.font = [UIFont systemFontOfSize:14];
        self.myTitle.textAlignment = NSTextAlignmentCenter;
    
        self.recommend_reason.numberOfLines = 0;
        self.recommend_reason.text = self.detailReason;
        self.recommend_reason.lineBreakMode = NSLineBreakByCharWrapping;
        CGSize size = [self.recommend_reason sizeThatFits:CGSizeMake(self.recommend_reason.frame.size.width, MAXFLOAT)];
        
        self.recommend_reason.frame = CGRectMake(self.recommend_reason.frame.origin.x, 299, self.recommend_reason.frame.size.width, size.height);
        //添加到cell
        [cell.contentView addSubview:self.recommend_reason];
        
        
    }
    else if (indexPath.section == 1)
    {
       
        
    }
    else if (indexPath.section == 2)
    {
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 360;
    }
    else if (indexPath.section == 2 || indexPath.section == 4)
    {
        return 360;
    }
    else
    {
        return 44;
    }
}

- (void)photoAction
{
    NSLog(@"我是照相机");
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
