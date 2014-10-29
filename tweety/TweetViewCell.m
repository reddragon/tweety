//
//  TweetViewCell.m
//  tweety
//
//  Created by Gaurav Menghani on 10/28/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import "TweetViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initWithTweet:(Tweet *)tweet {
    self.tweet = tweet;
    [self.tweetText setText:tweet.text];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-YYYY HH:mm:ss"];
    [self.tweetTimestamp setText:[dateFormatter stringFromDate:tweet.createdAt]];
    
    [self.profileImage setImageWithURL:tweet.imageURL];
}

@end
