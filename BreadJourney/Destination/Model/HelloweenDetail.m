//
//  HelloweenDetail.m
//  BreadJourney
//
//  Created by administrator on 10/29/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import "HelloweenDetail.h"

@implementation HelloweenDetail

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)detailWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
