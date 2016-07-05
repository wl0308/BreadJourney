//
//  destinationViewController.h
//  面包旅行
//
//  Created by administrator on 15/10/25.
//  Copyright (c) 2015年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface destinationViewController : UIViewController<UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end
