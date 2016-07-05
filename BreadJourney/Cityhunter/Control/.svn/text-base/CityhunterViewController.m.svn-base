//
//  CityhunterViewController.m
//  面包旅行
//
//  Created by administrator on 15/10/25.
//  Copyright (c) 2015年 administrator. All rights reserved.
//

#import "CityhunterViewController.h"
#import "Cityhunter.h"
#import "CityhunterTableViewCell.h"
#import "ScreenViewController.h"
#import "ScreenResult.h"
#import "ScreenViewTableViewCell.h"
#import "PlaceViewController.h"
#import "AFNetworking.h"
#define NAVSIZE_H self.navigationController.navigationBar.frame.size.height  //导航栏的高
#define NAVSIZE_W self.navigationController.navigationBar.frame.size.width   //导航栏的宽
#define MAINSIZE_W [UIScreen mainScreen].bounds.size.width
#define MAINSIZE_H [UIScreen mainScreen].bounds.size.height
@interface CityhunterViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    PlaceViewController *_placeVC;
    UILabel *lbl;
    NSMutableArray *_hunterArr;
//    UIButton *placeBtn;
}

@end

@implementation CityhunterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setHidesBackButton:YES];
    UILabel *titleText = [[UILabel alloc] initWithFrame:CGRectMake(MAINSIZE_W/16*7, 0, MAINSIZE_W/8, NAVSIZE_H)];
    titleText.backgroundColor = [UIColor clearColor];
    [titleText setFont:[UIFont systemFontOfSize:18.0]];
    titleText.textColor=[UIColor whiteColor];
    [titleText setText:@"城市猎人"];
    self.navigationItem.titleView=titleText;
    
    
    UIButton *screenBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    screenBtn.frame=CGRectMake(MAINSIZE_W-28, 0, 40, 28);
    [screenBtn setTitle:@"筛选" forState:UIControlStateNormal];
    screenBtn.titleLabel.font=[UIFont systemFontOfSize:15.0];
    UIBarButtonItem *screenResult=[[UIBarButtonItem alloc]initWithCustomView:screenBtn];
    [screenBtn addTarget:self action:@selector(screenMark) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=screenResult;
    
    
    

    _placeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _placeBtn.frame=CGRectMake(28, 0, 40, 28);
    [_placeBtn setTitle:@"上海" forState:UIControlStateNormal];
    _placeBtn.titleLabel.font=[UIFont systemFontOfSize:15.0];
    UIBarButtonItem *place=[[UIBarButtonItem alloc]initWithCustomView:_placeBtn];
    [_placeBtn addTarget:self action:@selector(place) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=place;

  
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"account_uploadavatar_btn"] forBarMetrics:UIBarMetricsDefault];
    
    _hunterArr=[[NSMutableArray alloc]init];
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    
    [mgr GET:@"http://api.breadtrip.com/hunter/products/more/?city_name" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSArray *dataArr = [dict valueForKey:@"product_list"];
        
        
        
        for (NSDictionary *dict in dataArr) {
            
            NSDictionary *userDict = [dict valueForKey:@"user"];
            NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
            [dataDict setObject:[dict valueForKey:@"title_page"] forKey:@"title_page"];
            [dataDict setObject:[userDict valueForKey:@"avatar_l"] forKey:@"avatar_l"];
            [dataDict setObject:[dict valueForKey:@"like_count"] forKey:@"like_count"];
            [dataDict setObject:[dict valueForKey:@"title"] forKey:@"title"];
            [dataDict setObject:[dict valueForKey:@"date_str"] forKey:@"date_str"];
            [dataDict setObject:[dict valueForKey:@"price"] forKey:@"price"];
            [dataDict setObject:[dict valueForKey:@"tab_list"] forKey:@"tab_list"];
            [dataDict setObject:[dict valueForKey:@"address"] forKey:@"address"];
            
            Cityhunter *cityHunter  = [Cityhunter cityhunterWithDict:dataDict];
            
            [_hunterArr addObject:cityHunter];
            _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAINSIZE_W, MAINSIZE_H)  style:UITableViewStylePlain];
            _tableView.delegate=self;
            _tableView.dataSource=self;
            _tableView.contentInset = UIEdgeInsetsMake(0,0,110,0);
            _tableView.showsVerticalScrollIndicator=NO;
            [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
            [self.view addSubview:_tableView];

        }
        
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];

    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _hunterArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.height/4*3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID=@"cell";
    CityhunterTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[CityhunterTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
   
    NSArray *subviews=[[NSArray alloc]initWithArray:cell.contentView.subviews];
    
    for (UIView *subview in subviews) {
        
        [subview removeFromSuperview];
        
    }
    
#warning  cell.cityhunter =[self.接受数据的数组 objectAtIndex:indexPath.section]
    
    Cityhunter *city = [_hunterArr objectAtIndex:indexPath.row];
    cell.cityhunter = city;
    [cell cityhunterShow];
    cell.userInteractionEnabled=NO;
    
    return cell;
}
-(void)screenMark{
    ScreenViewController *screenView=[[ScreenViewController alloc]init];
    ScreenViewTableViewCell *screenMarkView=[[ScreenViewTableViewCell alloc]init];
    NSString *filePath=[NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
    NSArray * array=[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    screenMarkView.selectedMark =[NSArray arrayWithArray:array];
    NSString *filePathLbl=[NSHomeDirectory() stringByAppendingPathComponent:@"arrayLbl.src"];
    NSArray * arrayLbl=[NSKeyedUnarchiver unarchiveObjectWithFile:filePathLbl];
    screenMarkView.selectedArr =[NSArray arrayWithArray:arrayLbl];
    [lbl removeFromSuperview];
    [self.navigationController pushViewController:screenView animated:YES];
}
-(void)place{
    [lbl removeFromSuperview];
    PlaceViewController *placeView=[[PlaceViewController alloc]init];
    [self.navigationController pushViewController:placeView animated:YES];
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
