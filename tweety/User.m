//
//  User.m
//  tweety
//
//  Created by Gaurav Menghani on 10/27/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithDictionary:(NSDictionary*)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.tagline = dictionary[@"description"];
        self.screenName = dictionary[@"screen_name"];
        self.profileImageUrl = dictionary[@"profile_image_url"];
    }
    
    return self;
}

@end
