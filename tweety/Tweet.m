//
//  Tweet.m
//  tweety
//
//  Created by Gaurav Menghani on 10/27/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import "Tweet.h"
#import "User.h"

@implementation Tweet
- (id)initWithDictionary:(NSDictionary*)dictionary {
    self = [super init];
    if (self) {
        self.text = dictionary[@"text"];
        self.user = [[User alloc] initWithDictionary:dictionary[@"user"]];
        NSString* createdAt = dictionary[@"created_at"];
        NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";
        self.createdAt = [formatter dateFromString:createdAt];
        NSString* imageURLStr = dictionary[@"user"][@"profile_image_url"];
        self.imageURL = [NSURL URLWithString:imageURLStr];
        self.biggerImageURL = [NSURL URLWithString:[imageURLStr stringByReplacingOccurrencesOfString:@"normal" withString:@"bigger"]];
        
        self.tId = dictionary[@"id"];
        self.retweetCount = dictionary[@"retweet_count"];
        self.favoriteCount = dictionary[@"favourite_count"];
        self.handle = dictionary[@"user"][@"screen_name"];
        self.realName = dictionary[@"user"][@"name"];
        // NSLog(@"Dictionary: %@", dictionary);
    }
    return self;
}

+ (NSArray*)tweetsWithArray:(NSArray *)array {
    NSMutableArray* tweets = [NSMutableArray array];
    for (NSDictionary* dict in array) {
        Tweet* tweet = [[Tweet alloc] initWithDictionary:dict];
        [tweets addObject:tweet];
    }
    return tweets;
}
@end
