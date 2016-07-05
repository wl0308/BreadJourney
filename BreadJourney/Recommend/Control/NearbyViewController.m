//
//  NearbyViewController.m
//  BreadJourney
//
//  Created by administrator on 15/10/31.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "NearbyViewController.h"
#import "AboutNearby.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#define NAVSIZE_H self.navigationController.navigationBar.frame.size.height  //导航栏的高
#define NAVSIZE_W self.navigationController.navigationBar.frame.size.width   //导航栏的宽
#define MAINSIZE_W [[UIScreen mainScreen] bounds].size.width  //屏幕宽
#define MAINSIZE_H [[UIScreen mainScreen] bounds].size.height // 屏幕高

@interface NearbyViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIImageView *blueImgView;
@property (nonatomic,strong) UIScrollView *myScrollView;
@property (nonatomic,strong) NSMutableArray *nearbyArr;
@property (nonatomic,strong) UITableView *myTableView;


@end

@implementation NearbyViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
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
    titleLab.text = @"我的附近";
    titleLab.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLab;
    
    
    NSTimer *mytimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(addScrollView) userInfo:nil repeats:NO];
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAINSIZE_W, MAINSIZE_H)];

    self.myTableView.backgroundColor = [UIColor colorWithRed:248.0 / 255.0f green:240.0 / 255.0f blue:213.0 / 255.0f alpha:0.5];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.myTableView];
    
    
    

}

- (void)addScrollView {
    
    //scrollview
    self.myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, NAVSIZE_W, 32)];
    self.myScrollView.contentSize = CGSizeMake(NAVSIZE_W + 200 , 0);
    self.myScrollView.showsHorizontalScrollIndicator = NO;
    self.myScrollView.showsVerticalScrollIndicator = NO;
    self.myScrollView.bounces = NO;
    self.myScrollView.pagingEnabled = YES;
    self.myScrollView.userInteractionEnabled = YES;
    self.myScrollView.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 3, NAVSIZE_W / 5 -20, 25)];
    [self drawBtn:btn1 function:@"全部"];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(20 + NAVSIZE_W / 5, 3, NAVSIZE_W / 5 -20, 25)];
    [self drawBtn:btn2 function:@"景点"];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(20 + NAVSIZE_W / 5 * 2, 3, NAVSIZE_W / 5 -20, 25)];
    [self drawBtn:btn3 function:@"住宿"];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(20 + NAVSIZE_W / 5 * 3, 3, NAVSIZE_W / 5 -20, 25)];
    [self drawBtn:btn4 function:@"餐厅"];
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(20 + NAVSIZE_W / 5 *4, 3, NAVSIZE_W / 5 -20, 25)];
    [self drawBtn:btn5 function:@"娱乐"];
    
    UIButton *btn6 = [[UIButton alloc] initWithFrame:CGRectMake(20 + NAVSIZE_W / 5 * 5, 3, NAVSIZE_W / 5 -20, 25)];
    [self drawBtn:btn6 function:@"购物"];
    
    
    self.blueImgView = [[UIImageView alloc] initWithFrame:CGRectMake(13 , 5, NAVSIZE_W / 5 -5, 22)];
    self.blueImgView.image = [UIImage imageNamed:@"account_uploadavatar_btn"];
    self.blueImgView.layer.cornerRadius = 12.0;
    self.blueImgView.layer.masksToBounds = YES;
    
    [self.myScrollView addSubview:self.blueImgView];
    
    [self.myScrollView addSubview:btn1];
    [self.myScrollView addSubview:btn2];
    [self.myScrollView addSubview:btn3];
    [self.myScrollView addSubview:btn4];
    [self.myScrollView addSubview:btn5];
    [self.myScrollView addSubview:btn6];
    
    
    
    [self.view addSubview:self.myScrollView];
    
    
    btn1.tag = 0;
    btn2.tag = 1;
    btn3.tag = 2;
    btn4.tag = 3;
    btn5.tag = 4;
    btn6.tag = 5;
    [btn1 addTarget:self action:@selector(imageMove:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(imageMove:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 addTarget:self action:@selector(imageMove:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 addTarget:self action:@selector(imageMove:) forControlEvents:UIControlEventTouchUpInside];
    [btn5 addTarget:self action:@selector(imageMove:) forControlEvents:UIControlEventTouchUpInside];
    [btn6 addTarget:self action:@selector(imageMove:) forControlEvents:UIControlEventTouchUpInside];
}

- (NSMutableArray *)nearbyArr {
    
    if (_nearbyArr == nil) {
        
        _nearbyArr = [NSMutableArray array];
        
        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
        mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
        [mgr GET:@"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=0&start=0&count=20&latitude=31.274478&longitude=120.743934&sign=2b6c85e882e882e6bdab4c68c014ac3c" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            NSArray *itemsArr = [dict valueForKey:@"items"];
            for (NSDictionary *dict1 in itemsArr) {
                
                NSMutableDictionary *dict2  = [NSMutableDictionary dictionary];
                
                NSMutableArray *arr = [NSMutableArray array];
                arr = [[dict1 valueForKey:@"tips"] mutableCopy];
                if (arr.count == 0) {
                  
                    NSMutableDictionary *dicts = [NSMutableDictionary dictionary];
                    [dicts setValue:@"" forKey:@"content"];
                    [arr addObject:dicts];
                   arr = [arr copy];
                    
                }
                NSMutableDictionary *dict3 = [arr objectAtIndex:0];
              
                [dict2 setObject:[dict1 valueForKey:@"name"] forKey:@"name"];
                [dict2 setObject:[dict1 valueForKey:@"rating"] forKey:@"rating"];
                [dict2 setObject:[dict1 valueForKey:@"tips_count"] forKey:@"tips_count"];
                [dict2 setObject:[dict3 valueForKey:@"content"] forKey:@"content"];
                [dict2 setObject:[dict1 valueForKey:@"visited_count"] forKey:@"visited_count"];
                [dict2 setObject:[dict1 valueForKey:@"cover_s"] forKey:@"cover_s"];
                
                AboutNearby *nearby = [AboutNearby NearbyWithDictionary:dict2];
                [_nearbyArr addObject:nearby];
               
            }
            
            [self.myTableView reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@",error);
            
        }];
        
    }
    
    return _nearbyArr;
}

- (void)imageMove:(UIButton *)btn {
    
    if (btn.tag == 0) {
        
        [UIView animateWithDuration:0.3 animations:^{
            self.blueImgView.transform = CGAffineTransformMakeTranslation(0 , 0);
        } completion:^(BOOL finished) {
            
        }];
        
        NSString *str = @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=0&start=0&count=20&latitude=31.274478&longitude=120.743934&sign=2b6c85e882e882e6bdab4c68c014ac3c";
        
        [self loadNearby:str];
        
    }
    else if (btn.tag == 1) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            
            self.blueImgView.transform = CGAffineTransformMakeTranslation(NAVSIZE_W / 5, 0);
            
            
        } completion:^(BOOL finished) {
            
            
        }];
        
        NSString *str = @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=11&start=0&count=20&latitude=40.116495&longitude=116.251411&sign=e0520518133354d66d4962b31c64bde4";
        
        [self loadNearby:str];
        
    }
    
    else if (btn.tag == 2) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            
            self.blueImgView.transform = CGAffineTransformMakeTranslation( NAVSIZE_W / 5 * 2 , 0);
            
            
        } completion:^(BOOL finished) {
            
        }];
        
        NSString *str = @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=10&start=0&count=20&latitude=40.116527&longitude=116.251405&sign=718322ba0e258290695edec9bee3f54c";
        
        [self loadNearby:str];
        
    }
    
    else if (btn.tag == 3) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            
            self.blueImgView.transform = CGAffineTransformMakeTranslation( NAVSIZE_W / 5 * 3 , 0);
            
            
        } completion:^(BOOL finished) {
            
            
        }];
        
        NSString *str = @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=5&start=0&count=20&latitude=40.116507&longitude=116.251410&sign=e2a1f22d4982ada31c3a4860232380ca";
        
        [self loadNearby:str];
        
    }
    
    
    else if (btn.tag == 4) {
        
        
        [UIView animateWithDuration:0.3 animations:^{
            
            
            self.blueImgView.transform = CGAffineTransformMakeTranslation( NAVSIZE_W / 5 * 4, 0);
            
            
        } completion:^(BOOL finished) {
            
            
        }];
        
        NSString *str = @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=21&start=0&count=20&latitude=40.116592&longitude=116.251397&sign=17c6657600a0e095229b4a804ab81ea0";
        
        [self loadNearby:str];
        
    }
    
    else if (btn.tag == 5) {
        
        
        [UIView animateWithDuration:0.3 animations:^{
            
            
            self.blueImgView.transform = CGAffineTransformMakeTranslation( NAVSIZE_W , 0);
            
            
        } completion:^(BOOL finished) {
            
        }];
        
        NSString *str = @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=6&start=0&count=20&latitude=40.116601&longitude=116.251394&sign=b8a9e4fca5e46a6bcfd5d3d6214bacf0";
        
        [self loadNearby:str];
        
    }
    
}


- (void)loadNearby:(NSString *)str {
    
    self.nearbyArr = [NSMutableArray array];
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    [mgr GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSArray *itemsArr = [dict valueForKey:@"items"];
        for (NSDictionary *dict1 in itemsArr) {
            
            NSMutableDictionary *dict2  = [NSMutableDictionary dictionary];
            
            NSMutableArray *arr = [NSMutableArray array];
            arr = [[dict1 valueForKey:@"tips"] mutableCopy];
            if (arr.count == 0) {
                
                NSMutableDictionary *dicts = [NSMutableDictionary dictionary];
                [dicts setValue:@"" forKey:@"content"];
                [arr addObject:dicts];
                arr = [arr copy];
                
            }
            NSMutableDictionary *dict3 = [arr objectAtIndex:0];
            
            [dict2 setObject:[dict1 valueForKey:@"name"] forKey:@"name"];
            [dict2 setObject:[dict1 valueForKey:@"rating"] forKey:@"rating"];
            [dict2 setObject:[dict1 valueForKey:@"tips_count"] forKey:@"tips_count"];
            [dict2 setObject:[dict3 valueForKey:@"content"] forKey:@"content"];
            [dict2 setObject:[dict1 valueForKey:@"visited_count"] forKey:@"visited_count"];
            [dict2 setObject:[dict1 valueForKey:@"cover_s"] forKey:@"cover_s"];
            
            AboutNearby *nearby = [AboutNearby NearbyWithDictionary:dict2];            [self.nearbyArr addObject:nearby];
        }
        
        [self.myTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
}

- (void)drawBtn:(UIButton *)btn function:(NSString *)name {
    
    [btn setTitle:name forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:26.0 / 255.0f green:26.0 / 255.0f blue:26.0 / 255.0f alpha:0.5] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    
}
- (void)goBack {
    
    
    [self.myScrollView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.nearbyArr.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //cell 重用
    NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    
    NSArray *viewArr = cell.contentView.subviews;
    for (UIView *view in viewArr) {
        
        [view removeFromSuperview];
        
    }
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:248.0 / 255.0f green:240.0 / 255.0f blue:213.0 / 255.0f alpha:0.5];
    AboutNearby *nearby = [self.nearbyArr objectAtIndex:indexPath.row];
    
    UIImageView *Coverimgview = [[UIImageView alloc] init];
    if (indexPath.row == 0) {
        
        Coverimgview.frame = CGRectMake(20 , 52, NAVSIZE_W / 3 - 15, NAVSIZE_W / 3 - 15);
    }
    else
    {
        
    Coverimgview.frame = CGRectMake(20 , 20, NAVSIZE_W / 3 - 15, NAVSIZE_W / 3 - 15);
        
    }
    [Coverimgview sd_setImageWithURL:[NSURL URLWithString:nearby.cover_s] placeholderImage:[UIImage imageNamed:@"cloud.jpg"]];

    [cell.contentView addSubview:Coverimgview];
    Coverimgview.layer.cornerRadius = 3.0;
    Coverimgview.layer.masksToBounds = YES;
    
    UILabel *titleLab = [[UILabel alloc] init];
    
    if (indexPath.row == 0) {
        
        titleLab.frame= CGRectMake(20 + NAVSIZE_W / 3, 38, 180, 40);
        
    }
    else
    {
    
        titleLab.frame = CGRectMake(20 + NAVSIZE_W / 3, 6, 180, 40);
    }
    titleLab.text = nearby.name;
    [cell.contentView addSubview:titleLab];
    
    [self starShow:[nearby.rating intValue] tableViewCell:cell Index:indexPath];
    
    UILabel *tipsLab = [[UILabel alloc] initWithFrame:CGRectMake(MAINSIZE_W / 3 + 155, 34, 100, 27)];
    if (indexPath.row == 0) {
        tipsLab.frame = CGRectMake(MAINSIZE_W / 3 + 155, 68, 100, 27);
    }
    tipsLab.text = [NSString stringWithFormat:@"%@ 点评",nearby.tips_count];
    tipsLab.textColor = [UIColor colorWithRed:50 / 255.0f green:50 / 255.0f blue:50 / 255.0f alpha:0.5];
    tipsLab.font = [UIFont systemFontOfSize:13];
    [cell.contentView addSubview:tipsLab];
    
    UILabel *contentsLab = [[UILabel alloc] initWithFrame:CGRectMake(19 + NAVSIZE_W / 3, 53, MAINSIZE_W / 3 * 2 - 58 , 54)];
    if (indexPath.row == 0) {
        
        contentsLab.frame = CGRectMake(19 + NAVSIZE_W / 3, 77, MAINSIZE_W / 3 * 2 - 58 , 54);
    }
    contentsLab.text = nearby.content;
    [contentsLab setNumberOfLines:0];
    contentsLab.font = [UIFont systemFontOfSize:14];
    contentsLab.numberOfLines = 2;
    contentsLab.textColor = [UIColor colorWithRed:50 / 255.0f green:50 / 255.0f blue:50 / 255.0f alpha:0.5];
    [cell.contentView addSubview:contentsLab];
   
    
    UILabel *visitedLab = [[UILabel alloc] initWithFrame:CGRectMake(19 + NAVSIZE_W / 3, MAINSIZE_W / 3 - 13 , 80, 20)];
    
    if (indexPath.row == 0) {
        visitedLab.frame = CGRectMake(19 + NAVSIZE_W / 3, MAINSIZE_W / 3 + 17 , 80, 20);
    }
    visitedLab.text = [NSString stringWithFormat:@"%@ 人去过",nearby.visited_count];
    visitedLab.textColor = [UIColor colorWithRed:50 / 255.0f green:50 / 255.0f blue:50 / 255.0f alpha:0.5];;
    visitedLab.font = [UIFont systemFontOfSize:14];
    [cell.contentView addSubview:visitedLab];
    
    
    return cell;
}

- (void)starShow:(int)rating tableViewCell:(UITableViewCell *)cell Index:(NSIndexPath *)index {
    
    if (index.row == 0) {
        
        for (int i = 0; i < rating; i++) {
            
            UIImageView *ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(18 + NAVSIZE_W / 3 + i *25, 68, 22, 22)];
            ImgView.image = [UIImage imageNamed:@"star_mark"];
            [cell.contentView addSubview:ImgView];
            
        }
        
        for (int i = 0; i < 5 - rating; i++) {
            
            
            UIImageView *ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(18 + NAVSIZE_W / 3 + rating *25 + i * 25,68, 25, 25)];
            ImgView.image = [UIImage imageNamed:@"star_mark1"];
            [cell.contentView addSubview:ImgView];
            
        }
        
    }
    else
    {

    for (int i = 0; i < rating; i++) {
        
        UIImageView *ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(18 + NAVSIZE_W / 3 + i *25, 36, 22, 22)];
        ImgView.image = [UIImage imageNamed:@"star_mark"];
        [cell.contentView addSubview:ImgView];
        
    }
    
    for (int i = 0; i < 5 - rating; i++) {
        
        
        UIImageView *ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(18 + NAVSIZE_W / 3 + rating *25 + i * 25,36, 25, 25)];
        ImgView.image = [UIImage imageNamed:@"star_mark1"];
        [cell.contentView addSubview:ImgView];
        
    }
  }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        
        return MAINSIZE_H / 5 + 32;
    }
    
    else
        return MAINSIZE_H / 5;
    
}








@end
