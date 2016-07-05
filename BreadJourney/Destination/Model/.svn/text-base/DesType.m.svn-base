//
//  DesType.m
//  BreadJourney
//
//  Created by administrator on 10/28/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import "DesType.h"
#import "DesImgs.h"

@implementation DesType

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        
        [self setValuesForKeysWithDictionary:dict];
        
        //取imgs对象，添加到imgs数组中
        NSMutableArray *imgsArr = [NSMutableArray array];
        
        for (NSDictionary *dict in self.imgs)
        {
            
            DesImgs *imgsDict = [DesImgs desImgsWithDict:dict];
            [imgsArr addObject:imgsDict];
            
        }
        
        self.imgs = imgsArr;
    }
    
    return self;
}

+ (instancetype)desTypeWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
