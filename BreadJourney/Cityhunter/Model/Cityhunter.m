//
//  Cityhunter.m
//  BreadJourney
//
//  Created by administrator on 15/10/28.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "Cityhunter.h"

@implementation Cityhunter
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self==[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)cityhunterWithDict:(NSDictionary *)dict{
    return [[super alloc]initWithDict:dict];
}
@end
