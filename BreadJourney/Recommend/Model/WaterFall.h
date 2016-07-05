//
//  WaterFall.h
//  BreadJourney
//
//  Created by administrator on 15/10/30.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WaterFall : NSObject
@property (nonatomic,copy) NSString *index_cover;
@property (nonatomic,copy) NSString *avatar_m;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *index_title;
@property (nonatomic,copy) NSString *share_url;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)WaterWithDictionary:(NSDictionary *)dict;
@end
