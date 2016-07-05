//
//  DropDown.m
//  BreadJourney
//
//  Created by administrator on 15/10/27.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "DropDown.h"
#define SCREEN_H [[UIScreen mainScreen] bounds].size.height
#define SCREEN_W [[UIScreen mainScreen] bounds].size.width

@implementation DropDown

@synthesize dropView,dropArray,searchText;

- (id)initWithFrame:(CGRect)frame {

    if (frame.size.height < (SCREEN_H - 10)) {
       
        frameHeight = SCREEN_H - 10;
    }
    
    else
    {
    
        frameHeight = frame.size.height;
        
    }
    
    viewHeight = frameHeight - 34;
    frame.size.height = 34.0f;
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        showList = NO; //默认不显示下拉框
        
        dropView = [[UIView alloc]initWithFrame:CGRectMake(0, 34, frame.size.width, 0)];
        dropView.backgroundColor = [UIColor colorWithRed:250.0 / 255.0f green:243.0 / 255.0f blue:227.0 / 255.0f alpha:0.5];
        
        dropView.hidden = YES;
        
        [self addSubview:dropView];
        
        searchText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        searchText.borderStyle = UITextBorderStyleRoundedRect;
        searchText.font = [UIFont systemFontOfSize:15];
        
        [searchText addTarget:searchText action:@selector(dropDown) forControlEvents:UIControlEventAllTouchEvents];
        
        [searchText addSubview:searchText];
        
    }
 
    return self;
    
}

- (void)dropDown {

    [searchText resignFirstResponder];
    
    if (showList) {
        
        return;

    }
    
    else
        
    {
    
        //列表显示
        
        CGRect sf = self.frame;
        sf.size.height = frameHeight;
        
        //dropdownlist放在前面  防止被遮挡
        
        [self.superview bringSubviewToFront:self];
        
        dropView.hidden = NO;
        showList = YES;
        
        CGRect frame = dropView.frame;
        frame.size.height = 0;
        dropView.frame =frame;
        frame.size.height = viewHeight;
        [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        self.frame =sf;
        dropView.frame = frame;
        [UIView commitAnimations];
    
    }
    
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {

    return NO;
    
}















@end
