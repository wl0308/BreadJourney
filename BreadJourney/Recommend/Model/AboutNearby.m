//
//  AboutNearby.m
//  BreadJourney
//
//  Created by administrator on 15/10/31.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "AboutNearby.h"

@implementation AboutNearby

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    if (self == [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }

    return self;
}
+ (instancetype)NearbyWithDictionary:(NSDictionary *)dict {

    return [[super alloc] initWithDictionary:dict];
    
}
@end
