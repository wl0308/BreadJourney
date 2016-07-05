//
//  ScreenViewTableViewCell.m
//  BreadJourney
//
//  Created by administrator on 15/10/29.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "ScreenViewTableViewCell.h"

@implementation ScreenViewTableViewCell
#define MAINSIZE_W [UIScreen mainScreen].bounds.size.width
#define MAINSIZE_H [UIScreen mainScreen].bounds.size.height

-(void)screenResultShow{

    self.contentView.backgroundColor=[UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    _markView=[[UIView alloc]initWithFrame:CGRectMake(MAINSIZE_W/16, 0, MAINSIZE_W, MAINSIZE_H-MAINSIZE_W/2)];
    _checkedButton=[[NSMutableArray alloc]init];
    UILabel *selectMark=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, MAINSIZE_W, MAINSIZE_H/12)];
    selectMark.text=@"选择标签";
    selectMark.font=[UIFont systemFontOfSize:16.0f];
    selectMark.textColor=[UIColor colorWithRed:95.0f/255.0f green:95.0f/255.0f blue:95.0f/255.0f alpha:0.5];
    
    [_markView addSubview:selectMark];
    _markArr=[NSArray arrayWithObjects:@"全部",@"摄影",@"亲子",@"Brunch&下午茶",@"聚会&派对",@"社交",@"运动",@"美食",@"文化体验",@"户外运动",@"城市漫步",@"DIY",@"艺术",@"旅行咨询", nil];
    _btnMutableArray=[[NSMutableArray alloc]init];
//    _selectedArr=[[NSMutableArray alloc]init];
    CGFloat w = 0;
    CGFloat h = MAINSIZE_H/12;
    for (int i = 0; i < _markArr.count; i++) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button.layer setMasksToBounds:YES];
        [_button.layer setCornerRadius:20];
        [_button.layer setBorderWidth:0.5f];
        CGColorSpaceRef colorSpaceRef=CGColorSpaceCreateDeviceRGB();
        CGColorRef color=CGColorCreate(colorSpaceRef, (CGFloat[]){1,1,1,1});
        [_button.layer setBorderColor:color];
        
        _button.tag=0;

        _button.backgroundColor = [UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
        [_button addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.layer.cornerRadius=15;
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
        CGFloat length = [_markArr[i] boundingRectWithSize:CGSizeMake(MAINSIZE_W, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
        [_button setTitle:_markArr[i] forState:UIControlStateNormal];
        _button.frame = CGRectMake(MAINSIZE_W/32 + w, h, length + MAINSIZE_W/16*3 , MAINSIZE_H/16);
        if(MAINSIZE_W/32 + w + length + MAINSIZE_W/16*3 > MAINSIZE_W-MAINSIZE_W/16){
            w = 0;
            h = h + _button.frame.size.height + MAINSIZE_H/48;
            _button.frame = CGRectMake(MAINSIZE_W/32 + w, h, length + MAINSIZE_W/16*3, MAINSIZE_H/16);
        }
        w = _button.frame.size.width + _button.frame.origin.x;
        [_btnMutableArray addObject:_button];
        if (_button.tag==1) {
            
            [_checkedButton addObject:_button.titleLabel.text];
//            [_selectedArr addObject:_button];
        }
        
       
        
        [_markView addSubview:_button];
    }

    
    
    NSString *filePath=[NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
    NSArray * array=[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    _selectedMark =[NSArray arrayWithArray:array];
    for (NSString *str in array) {
        NSLog(@"%@",str);
        for (int i=0; i<_markArr.count; i++) {
            if ([str isEqualToString:_markArr[i]]) {
                ((UIButton *)[_btnMutableArray objectAtIndex:i]).tag=1;
                ((UIButton *)[_btnMutableArray objectAtIndex:i]).backgroundColor=[UIColor whiteColor];
                [((UIButton *)[_btnMutableArray objectAtIndex:i]) setTitleColor:[UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
            }
        }
    }
    if (_selectedMark.count==0) {
        NSLog(@"%d",(int)_selectedMark.count);
        ((UIButton *)[_btnMutableArray objectAtIndex:0]).tag=1;
        ((UIButton *)[_btnMutableArray objectAtIndex:0]).backgroundColor=[UIColor whiteColor];
        [((UIButton *)[_btnMutableArray objectAtIndex:0]) setTitleColor:[UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
        
        
//        [self.contentView addSubview:_markView];
        
        
    }
    [self.contentView addSubview:_markView];
    
    
    
    _sortView=[[UIView alloc]initWithFrame:CGRectMake(0, MAINSIZE_H-MAINSIZE_W/16*9, MAINSIZE_W, MAINSIZE_H-MAINSIZE_W/16*7)];
    UILabel *sortTitle=[[UILabel alloc]initWithFrame:CGRectMake(MAINSIZE_W/16, 0, MAINSIZE_W, MAINSIZE_H/12)];
    sortTitle.text=@"排序";
    sortTitle.font=[UIFont systemFontOfSize:16.0f];
    sortTitle.textColor=[UIColor colorWithRed:95.0f/255.0f green:95.0f/255.0f blue:95.0f/255.0f alpha:0.5];
    
    [_sortView addSubview:sortTitle];
    for (int j=0; j<4; j++) {
        UIImageView *HR=[[UIImageView alloc]initWithFrame:CGRectMake(MAINSIZE_W/24, MAINSIZE_H/12*j+MAINSIZE_H/12, MAINSIZE_W/12*11, 0.5f)];
        HR.backgroundColor=[UIColor whiteColor];
        [_sortView addSubview:HR];
    }
    NSArray *sortArr=[NSArray arrayWithObjects:@"智能排序",@"距离最近",@"人气最高",@"销量最高", nil];
    for (int z=0; z<sortArr.count; z++) {
        UIButton *sort=[[UIButton alloc]initWithFrame:CGRectMake(MAINSIZE_W/16, MAINSIZE_H/12*z+MAINSIZE_H/48*5, MAINSIZE_W-MAINSIZE_W/8, MAINSIZE_H/48*3)];
        sort.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
                sort.tag=z+100;
        sort.titleLabel.font=[UIFont systemFontOfSize:15.0f];
        [sort setTitle:sortArr[z] forState:UIControlStateNormal];
        [sort setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sort addTarget:self action:@selector(checked:) forControlEvents:UIControlEventTouchUpInside];
        [_sortView addSubview:sort];
        [_sortView addSubview:_sortChecked];
    }
    _lbl1=[[UILabel alloc]initWithFrame:CGRectMake(MAINSIZE_W-MAINSIZE_W/8, MAINSIZE_H/48*5, MAINSIZE_W/8, MAINSIZE_W/48*3)];
//    _lbl1.text=@"√";
    _lbl1.textColor=[UIColor whiteColor];
    [_sortView addSubview:_lbl1];
    _lbl2=[[UILabel alloc]initWithFrame:CGRectMake(MAINSIZE_W-MAINSIZE_W/8, MAINSIZE_H/48*5+MAINSIZE_H/12, MAINSIZE_W/8, MAINSIZE_W/48*3)];
    [_sortView addSubview:_lbl2];
    _lbl2.textColor=[UIColor whiteColor];
    _lbl3=[[UILabel alloc]initWithFrame:CGRectMake(MAINSIZE_W-MAINSIZE_W/8, MAINSIZE_H/48*5+MAINSIZE_H/6, MAINSIZE_W/8, MAINSIZE_W/48*3)];
    [_sortView addSubview:_lbl3];
    _lbl3.textColor=[UIColor whiteColor];
    _lbl4=[[UILabel alloc]initWithFrame:CGRectMake(MAINSIZE_W-MAINSIZE_W/8, MAINSIZE_H/48*5+MAINSIZE_H/4, MAINSIZE_W/8, MAINSIZE_W/48*3)];
    [_sortView addSubview:_lbl4];
    _lbl4.textColor=[UIColor whiteColor];
    
    NSString *filePathLbl=[NSHomeDirectory() stringByAppendingPathComponent:@"arrayLbl.src"];
    NSArray * arrayLbl=[NSKeyedUnarchiver unarchiveObjectWithFile:filePathLbl];
    _selectedArr =[NSArray arrayWithArray:arrayLbl];

    _lbl1.text=_selectedArr[0];
    _lbl2.text=_selectedArr[1];
    _lbl3.text=_selectedArr[2];
    _lbl4.text=_selectedArr[3];
    
    [self.contentView addSubview:_sortView];
    
    
}
- (void)handleClick:(UIButton *)btn{

     NSString * checked=btn.titleLabel.text;
    if (btn.tag==0) {
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
        [_checkedButton addObject:btn.titleLabel.text];
//        [_selectedArr addObject:_button];
        btn.tag=1;
    }else if(btn.tag==1){
        btn.backgroundColor = [UIColor colorWithRed:63.0f/255.0f green:176.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        for (int i=0; i<_checkedButton.count; i++) {
            if ([checked isEqualToString:_checkedButton[i]]) {
                [_checkedButton removeObject:_checkedButton[i]];
//                [_selectedArr removeObject:_selectedArr[i]];
            }
        }
        btn.tag=0;
    }
//    if (btn.tag==1) {
//        [_selectedArr addObject:btn];
//    }
}


-(void)checked:(UIButton *)btn {
    
    if (btn.tag==100) {
        _lbl1.text=@"√";
        _lbl2.text=@"";
        _lbl3.text=@"";
        _lbl4.text=@"";
    }else if(btn.tag==101){
        _lbl1.text=@"";
        _lbl2.text=@"√";
        _lbl3.text=@"";
        _lbl4.text=@"";
    }else if(btn.tag==102){
        _lbl1.text=@"";
        _lbl2.text=@"";
        _lbl3.text=@"√";
        _lbl4.text=@"";
    }else if(btn.tag==103){
        _lbl1.text=@"";
        _lbl2.text=@"";
        _lbl3.text=@"";
        _lbl4.text=@"√";
    }
    _selectedArr=[NSArray arrayWithObjects:_lbl1.text,_lbl2.text,_lbl3.text,_lbl4.text, nil];
}
@end
