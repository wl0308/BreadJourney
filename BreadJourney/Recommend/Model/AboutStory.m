//
//  AboutStory.m
//  BreadJourney
//
//  Created by administrator on 15/10/28.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import "AboutStory.h"

@implementation AboutStory

- (instancetype)initwithDictionary:(NSDictionary *)dict {
    
    if (self == [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }

    return self;
    
}

+ (instancetype)StoryWithDictionary:(NSDictionary *)dict {

    return [[super alloc] initwithDictionary:dict];
    
}

@end
