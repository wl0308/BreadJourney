//
//  destinationViewController.m
//  面包旅行
//
//  Created by administrator on 15/10/25.
//  Copyright (c) 2015年 administrator. All rights reserved.
//

#import "destinationViewController.h"
#import "DestinationCollectionViewCell.h"
#import "DestinationHeaderView.h"
#import "DesImgs.h"
#import "DesType.h"
#import "common.h"
#import "CityViewController.h"
#import "CountryViewController.h"
#import "NearbyViewController.h"

static NSString *cellID = @"cell";
static NSString *headerID = @"header";

@interface destinationViewController ()<HeaderClickDelegate>

@property (nonatomic, strong) NSArray *imgArr;
@property (nonatomic,strong) UITextField * searchText;
@property (nonatomic,strong) UIImageView * navImgView;

@end

@implementation destinationViewController

/**
 *  懒加载
 */
- (NSArray *)imgArr
{
    if (_imgArr == nil) {
        
        NSString *filename = [[NSBundle mainBundle]pathForResource:@"Destination" ofType:@"plist"];
        NSArray *desArr = [NSArray arrayWithContentsOfFile:filename];
        
        NSMutableArray *typeArr = [NSMutableArray array];
        
        for (NSDictionary *dict in desArr)
        {
            
            DesType *destype = [DesType desTypeWithDict:dict];
            [typeArr addObject:destype];
            
        }
        _imgArr = typeArr;
    }
    return _imgArr;
}

/**
 *  自定义导航栏
 */
- (void)initNav
{
    //添加导航栏背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"account_uploadavatar_btn"] forBarMetrics:UIBarMetricsDefault];
    
    //添加自定义搜索栏
    self.navImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"auth_confirm_button_bg"]];
    self.navImgView.frame = CGRectMake(10, 27, Navsize_W - 80, Navsize_H - 14);
    
    [self.navigationController.view addSubview:self.navImgView];
    
    //添加搜索文本框
    self.searchText = [[UITextField alloc] initWithFrame:CGRectMake(20, 27, Navsize_W - 90, Navsize_H - 14)];
    self.searchText.textColor = [UIColor whiteColor];
    self.searchText.font = [UIFont systemFontOfSize:14];
    self.searchText.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.searchText.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索目的地、游记..." attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self.navigationController.view addSubview:self.searchText];
    
    //添加右侧附近按钮
    UIButton *nearbybtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nearbybtn.frame = CGRectMake(0, 0, 40, 30);
    [nearbybtn setTitle:@"附近" forState:UIControlStateNormal];
    nearbybtn.titleLabel.font = [UIFont systemFontOfSize:15];
    nearbybtn.titleLabel.textColor = [UIColor whiteColor];
    
    [nearbybtn addTarget:self action:@selector(nearbyAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *nearbyitem = [[UIBarButtonItem alloc]initWithCustomView:nearbybtn];
    self.navigationItem.rightBarButtonItem = nearbyitem;
}

#pragma mark - 附近点击响应事件
- (void)nearbyAction
{
    NearbyViewController *nearby = [[NearbyViewController alloc]initWithNibName:@"NearByTableViewController" bundle:nil];
    
    self.navImgView.hidden = YES;
    self.searchText.hidden = YES;
    
    [self.navigationController pushViewController:nearby animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navImgView.hidden = NO;
    self.searchText.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载导航栏
    [self initNav];
    
    /**
     初始化collectionView
     */
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //设置滑动方向
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setSectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    //设置collectionView属性
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 10, Screen_W, Screen_H - 64 - 10) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    //注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"Destination" bundle:nil] forCellWithReuseIdentifier:cellID];
    
    //注册header视图
    [self.collectionView registerNib:[UINib nibWithNibName:@"DesHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSLog(@"++++%lu",(unsigned long)self.imgArr.count);
    return self.imgArr.count;
}

/**
 *  @return 返回每一段item的数量
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"----%lu",(unsigned long)[[self.imgArr[section]imgs]count ]);
    
    return [[self.imgArr[section]imgs]count ];
}

/**
 *  @return 返回每一个item的布局
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DestinationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    if (cell == nil) {
       
        cell = [[DestinationCollectionViewCell alloc]init];
    }
    
    DesType *destype = self.imgArr[indexPath.section];
    DesImgs *desimgs = destype.imgs[indexPath.row];
        
    [cell setCell:desimgs];
    
    return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((Screen_W - 30) / 2.0, 150);
}
/**
 *  @return 返回每个分区的headerView的大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(Screen_W, 30);
}

/**
 *  瀑布流头部
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    DestinationHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
    
    if (headerView == nil) {
        headerView = [[DestinationHeaderView alloc]init];
    }
    DesType *destype = self.imgArr[indexPath.section];
        
    [headerView setHeaderView:destype with:indexPath.section];
    
    
    return headerView;
}

#pragma mark - cell选择事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CityViewController *city = [[CityViewController alloc]initWithNibName:@"CityViewController" bundle:nil];
    DesType *destype = self.imgArr[indexPath.section];
    DesImgs *detail = destype.imgs[indexPath.row];
    
    city.url = detail.url;
    
    self.searchText.hidden = YES;
    self.navImgView.hidden = YES;
    
    self.tabBarController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:city animated:YES];
    
}

- (void)headerbtnClick
{
    CountryViewController *country = [[CountryViewController alloc]initWithNibName:@"CountryViewController" bundle:nil];
    [self.navigationController pushViewController:country animated:YES];
}

@end
