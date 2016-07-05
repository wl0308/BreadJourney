//
//  AboutStory.h
//  BreadJourney
//
//  Created by administrator on 15/10/28.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AboutStory : NSObject
@property (nonatomic,copy) NSString *storyimage;
@property (nonatomic,copy) NSString *headimage;
@property (nonatomic,copy) NSString *aboutstory;
@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *spot_id;

- (instancetype)initwithDictionary:(NSDictionary *)dict;
+ (instancetype)StoryWithDictionary:(NSDictionary *)dict;
@end
