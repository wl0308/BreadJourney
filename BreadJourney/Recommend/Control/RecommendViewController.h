//
//  RecommendViewController.h
//  面包旅行
//
//  Created by administrator on 15/10/25.
//  Copyright (c) 2015年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface RecommendViewController : UIViewController
@property (nonatomic,retain) UIScrollView *myScrollView;
@property (nonatomic,retain) NSMutableArray *imageArray;
@property (nonatomic,retain) NSTimer *time;
@property (nonatomic,retain) UIPageControl *myPageControl;
@property (strong, nonatomic) UITableView *myTableView;


@end
