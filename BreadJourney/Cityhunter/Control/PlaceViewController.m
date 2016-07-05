//
//  PlaceViewController.m
//  BreadJourney
//
//  Created by administrator on 15/10/28.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "PlaceViewController.h"
#import "CityhunterViewController.h"
#define NAVSIZE_H self.navigationController.navigationBar.frame.size.height  //导航栏的高
#define NAVSIZE_W self.navigationController.navigationBar.frame.size.width
#define MAINSIZE_W [UIScreen mainScreen].bounds.size.width
#define MAINSIZE_H [UIScreen mainScreen].bounds.size.height
@interface PlaceViewController ()<UIScrollViewDelegate>{
    UIScrollView *_scrollView;
//    PlaceTableViewCell *cell;
}

@end

@implementation PlaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _placeClickArr=[[NSMutableArray alloc]init];
    [self.navigationItem setHidesBackButton:YES];
    self.navigationController.navigationBar.shadowImage=[[UIImage alloc]init];
    self.navigationController.navigationBar.translucent=NO;
    UILabel *titleText = [[UILabel alloc] initWithFrame:CGRectMake(MAINSIZE_W/16*7, 0, MAINSIZE_W/8, NAVSIZE_H)];
    titleText.backgroundColor = [UIColor clearColor];
    [titleText setFont:[UIFont systemFontOfSize:18.0]];
    titleText.textColor=[UIColor whiteColor];
    [titleText setText:@"选择城市"];
    self.navigationItem.titleView=titleText;
    
    self.view.backgroundColor=[UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    UIButton *goAway=[UIButton buttonWithType:UIButtonTypeCustom];
    [goAway setTitle:@"X" forState:UIControlStateNormal];
    goAway.titleLabel.font=[UIFont systemFontOfSize:24.0f];
    goAway.frame=CGRectMake(MAINSIZE_W/32*13, MAINSIZE_H-MAINSIZE_W/2, MAINSIZE_W/16*3, MAINSIZE_W/16*3);
    [goAway addTarget:self action:@selector(goAway) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goAway];
    
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, MAINSIZE_H/24, MAINSIZE_W, MAINSIZE_H-MAINSIZE_W/8*5)];
    _scrollView.contentSize=CGSizeMake(0, MAINSIZE_H*1.5);
    _scrollView.delegate=self;
    _scrollView.backgroundColor=[UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
//    _scrollView.backgroundColor=[UIColor whiteColor];
//    self.backgroundColor=[UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    //    self.backgroundColor=[UIColor whiteColor];
    _placeView=[[UIView alloc]initWithFrame:CGRectMake(MAINSIZE_W/16, 0, MAINSIZE_W/16*15, MAINSIZE_H/16*5)];
    _placeMAXView=[[UIView alloc]initWithFrame:CGRectMake(MAINSIZE_W/16, MAINSIZE_H/16*5, MAINSIZE_W/16*15, MAINSIZE_H*1.2)];
    //    _checkedButton=[[NSMutableArray alloc]init];
    UILabel *pitch=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, MAINSIZE_W, MAINSIZE_H/12)];
    pitch.text=@"GPS定位失败";
    pitch.font=[UIFont systemFontOfSize:14.0f];
    pitch.textColor=[UIColor colorWithRed:95.0f/255.0f green:95.0f/255.0f blue:95.0f/255.0f alpha:0.5];
    
    UILabel *selectMark=[[UILabel alloc]initWithFrame:CGRectMake(0, MAINSIZE_H/10, MAINSIZE_W, MAINSIZE_H/12)];
    selectMark.text=@"热门城市";
    selectMark.font=[UIFont systemFontOfSize:14.0f];
    selectMark.textColor=[UIColor colorWithRed:95.0f/255.0f green:95.0f/255.0f blue:95.0f/255.0f alpha:0.5];
    
    NSArray *placeArr=@[@"北京",@"上海",@"深圳"];
    for (int i=0; i<placeArr.count; i++) {
        UIButton *place=[UIButton buttonWithType:UIButtonTypeSystem];
        [place.layer setMasksToBounds:YES];
        [place.layer setCornerRadius:15];
        [place.layer setBorderWidth:0.5f];
        CGColorSpaceRef colorSpaceRef=CGColorSpaceCreateDeviceRGB();
        CGColorRef color=CGColorCreate(colorSpaceRef, (CGFloat[]){1,1,1,1});
        [place.layer setBorderColor:color];
        place.backgroundColor=[UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
        [place addTarget:self action:@selector(chick:) forControlEvents:UIControlEventTouchUpInside];
        [place setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        place.frame=CGRectMake(MAINSIZE_W/24*7*i, MAINSIZE_H/24*5, MAINSIZE_W/4, MAINSIZE_H/16);
        [place setTitle:placeArr[i] forState:UIControlStateNormal];
        [_placeView addSubview:place];
    }
    [_placeView addSubview:pitch];
    [_placeView addSubview:selectMark];
    
    
    UILabel *placeMAX=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, MAINSIZE_W, MAINSIZE_H/12)];
    placeMAX.text=@"全部城市";
    placeMAX.font=[UIFont systemFontOfSize:14.0f];
    placeMAX.textColor=[UIColor colorWithRed:95.0f/255.0f green:95.0f/255.0f blue:95.0f/255.0f alpha:0.5];
    [_placeMAXView addSubview:placeMAX];
    
    for (int i=0; i<12; i++) {
        UIImageView *HR=[[UIImageView alloc]initWithFrame:CGRectMake(0, MAINSIZE_H/12*i+MAINSIZE_H/12, MAINSIZE_W/12*11, 0.5f)];
        HR.backgroundColor=[UIColor whiteColor];
        [_placeMAXView addSubview:HR];
    }
    NSArray *placeMaxArr=@[@"巴黎",@"北京",@"东京",@"广州",@"西安",@"清迈",@"上海",@"深圳",@"天津",@"武汉",@"香港",@"悉尼"];
    for (int i=0; i<placeMaxArr.count; i++) {
        UIButton *placeAll=[UIButton buttonWithType:UIButtonTypeSystem];
        placeAll.backgroundColor=[UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
        [placeAll addTarget:self action:@selector(chick:) forControlEvents:UIControlEventTouchUpInside];
        [placeAll setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        placeAll.frame=CGRectMake(0, MAINSIZE_H/12*i+MAINSIZE_H/48*5, MAINSIZE_W/16*15, MAINSIZE_H/16);
        [placeAll setTitle:placeMaxArr[i] forState:UIControlStateNormal];
        placeAll.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_placeMAXView addSubview:placeAll];
    }
    
    [_scrollView addSubview:_placeMAXView];
    [_scrollView addSubview:_placeView];
    [self.view addSubview:_scrollView];
}
-(void)goAway{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)chick:(UIButton *)btn{
#warning 返回时把当前点击按钮的值传给主页面的leftBarButtonItem
    

    CityhunterViewController *cityhunter=[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    cityhunter.placeBtn.titleLabel.text=btn.titleLabel.text;
    [self.navigationController popToViewController:cityhunter animated:YES];
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
