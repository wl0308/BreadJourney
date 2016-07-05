//
//  HelloweenType.m
//  BreadJourney
//
//  Created by administrator on 10/29/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import "HelloweenType.h"
#import "HelloweenDetail.h"
@implementation HelloweenType

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        
        [self setValuesForKeysWithDictionary:dict];
        
        //取imgs对象，添加到imgs数组中
        NSMutableArray *detailArr = [NSMutableArray array];
        
        for (NSDictionary *dict in self.detail)
        {
            
            HelloweenDetail *detailDict = [HelloweenDetail detailWithDict:dict];
            [detailArr addObject:detailDict];
            
        }
        
        self.detail = detailArr;
    }
    
    return self;
}

+ (instancetype)helloweenTypeWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
