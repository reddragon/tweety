//
//  Tweet.h
//  tweety
//
//  Created by Gaurav Menghani on 10/27/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSDate* createdAt;
@property (nonatomic, strong) User* user;
@property (nonatomic, strong) NSURL* imageURL;

- (id)initWithDictionary:(NSDictionary*)dictionary;
+ (NSArray *)tweetsWithArray:(NSArray*)array;
@end
