//
//  ItemDetailViewController.h
//  BreadJourney
//
//  Created by administrator on 10/28/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (weak, nonatomic) NSString *detailCover;
@property (weak, nonatomic) NSString *detailTitle;
@property (nonatomic, weak) NSString *detailReason;

@end
