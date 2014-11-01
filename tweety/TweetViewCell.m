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
    [self.realName setText:tweet.realName];
    [self.handle setText:tweet.handle];
    [self.retweetCount setText:[tweet.retweetCount stringValue]];
    [self.favoriteCount setText:[tweet.favoriteCount stringValue]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-YYYY HH:mm:ss"];
    [self.tweetTimestamp setText:[dateFormatter stringFromDate:tweet.createdAt]];
    
    [self.profileImage setImageWithURL:tweet.biggerImageURL];
    [self.profileImage.layer setCornerRadius:self.profileImage.frame.size.width / 2];
    self.profileImage.clipsToBounds = YES;
    self.profileImage.layer.borderWidth = 3.0f;
    self.profileImage.layer.borderColor = [UIColor lightGrayColor].CGColor;

}

@end
