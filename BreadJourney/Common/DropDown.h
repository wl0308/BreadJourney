//
//  DropDown.h
//  BreadJourney
//
//  Created by administrator on 15/10/27.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropDown : UIView <UITextFieldDelegate> {

    UIView *dropView; //下拉表
    NSArray *dropArray;//下拉数据
    UITextField *searchText; //文本输入框
    BOOL showList; //是否弹出下拉框
    CGFloat viewHeight; //下拉列表高度
    CGFloat frameHeight;//frame高度
    
}

@property (nonatomic,retain) UIView *dropView;
@property (nonatomic,retain) NSArray *dropArray;
@property (nonatomic,retain) UITextField *searchText;
@end
