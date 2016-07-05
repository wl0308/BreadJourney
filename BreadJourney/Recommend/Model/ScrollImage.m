//
//  ScrollImage.m
//  BreadJourney
//
//  Created by administrator on 15/10/30.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "ScrollImage.h"

@implementation ScrollImage

- (instancetype)initWithDictionary:(NSDictionary *)dict {

    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}
+ (instancetype)ScrollWithDictionary:(NSDictionary *)dict {

    return [[super alloc] initWithDictionary:dict];
    
}

@end
