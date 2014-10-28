//
//  User.h
//  tweety
//
//  Created by Gaurav Menghani on 10/27/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* screenName;
@property (nonatomic, strong) NSString* profileImageUrl;
@property (nonatomic, strong) NSString* tagline;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
