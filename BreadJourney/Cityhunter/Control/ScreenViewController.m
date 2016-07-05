//
//  ScreenViewController.m
//  BreadJourney
//
//  Created by administrator on 15/10/28.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "ScreenViewController.h"
#import "TabBarViewController.h"
#import "ScreenResult.h"
#import "ScreenViewTableViewCell.h"

#define NAVSIZE_H self.navigationController.navigationBar.frame.size.height  //导航栏的高
#define NAVSIZE_W self.navigationController.navigationBar.frame.size.width   //导航栏的宽
#define MAINSIZE_W [UIScreen mainScreen].bounds.size.width
#define MAINSIZE_H [UIScreen mainScreen].bounds.size.height
@interface ScreenViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_result;
    ScreenViewTableViewCell *cell;
}

@end

@implementation ScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    TabBarViewController *tabBar=[[TabBarViewController alloc]init];
    tabBar.btn1.hidden=YES;
    tabBar.btn2.hidden=YES;
    tabBar.btn3.hidden=YES;
    tabBar.btn4.hidden=YES;
    tabBar.btn5.hidden=YES;

    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAINSIZE_W, MAINSIZE_H-MAINSIZE_W/16*11) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    _tableView.separatorStyle=UITableViewCellSelectionStyleNone;
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
    [self.view addSubview:_tableView];
    
    self.navigationController.navigationBar.shadowImage=[[UIImage alloc]init];
    self.navigationController.navigationBar.translucent=NO;
    UILabel *titleText = [[UILabel alloc] initWithFrame:CGRectMake(MAINSIZE_W/16*7, 0, MAINSIZE_W/8, NAVSIZE_H)];
    titleText.backgroundColor = [UIColor clearColor];
    [titleText setFont:[UIFont systemFontOfSize:18.0]];
    titleText.textColor=[UIColor whiteColor];
    [titleText setText:@"筛选&排序"];
    self.navigationItem.titleView=titleText;
    
    self.view.backgroundColor=[UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    UIButton *goAway=[UIButton buttonWithType:UIButtonTypeCustom];
    [goAway setTitle:@"X" forState:UIControlStateNormal];
    goAway.titleLabel.font=[UIFont systemFontOfSize:24.0f];
    goAway.frame=CGRectMake(MAINSIZE_W/32*13, MAINSIZE_H-MAINSIZE_W/2, MAINSIZE_W/16*3, MAINSIZE_W/16*3);
    [goAway addTarget:self action:@selector(goAway) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goAway];
    
    UIButton *save=[UIButton buttonWithType:UIButtonTypeCustom];
    [save setTitle:@"保存" forState:UIControlStateNormal];
    save.titleLabel.font=[UIFont systemFontOfSize:20.0f];
    save.frame=CGRectMake(MAINSIZE_W/4, MAINSIZE_H-MAINSIZE_W/16*10, MAINSIZE_W/2, MAINSIZE_W/8);
    [save.layer setMasksToBounds:YES];
    [save.layer setCornerRadius:20];
    [save.layer setBorderWidth:1.5f];
    CGColorSpaceRef colorSpaceRef=CGColorSpaceCreateDeviceRGB();
    CGColorRef color=CGColorCreate(colorSpaceRef, (CGFloat[]){1,1,1,1});
    [save.layer setBorderColor:color];
    
    [save addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:save];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)save{
#warning 返回前先判断当前所以按钮的tag，如果tag为1，就也加到归档中（未解决 ）
    
    NSString *filePath=[NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
    BOOL success=[NSKeyedArchiver archiveRootObject:cell.checkedButton toFile:filePath];
    
    if (success) {
        NSLog(@"保存成功");
    }
    NSString *filePathLbl=[NSHomeDirectory() stringByAppendingPathComponent:@"arrayLbl.src"];
    BOOL successLbl=[NSKeyedArchiver archiveRootObject:cell.selectedArr toFile:filePathLbl];
    
    if (successLbl) {
        NSLog(@"√保存成功");
    }
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)goAway{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MAINSIZE_H*1.1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID=@"cell";
    cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
        if (cell==nil) {
        cell=[[ScreenViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSArray *subviews=[[NSArray alloc]initWithArray:cell.contentView.subviews];
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
    [cell screenResultShow];
    


    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.selectionStyle=NO;
    return cell;
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
