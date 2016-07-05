//
//  HelloweenType.h
//  BreadJourney
//
//  Created by administrator on 10/29/15.
//  Copyright (c) 2015 SHIDLE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelloweenType : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSMutableArray *detail;

+ (instancetype) helloweenTypeWithDict:(NSDictionary *) dict;
- (instancetype) initWithDict:(NSDictionary *) dict;


@end
