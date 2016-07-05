//
//  ScrollImage.h
//  BreadJourney
//
//  Created by administrator on 15/10/30.
//  Copyright (c) 2015年 SHIDLE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScrollImage : NSObject

@property (nonatomic,copy) NSString *image_url;
@property (nonatomic,copy) NSString *html_url;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)ScrollWithDictionary:(NSDictionary *)dict;

@end
