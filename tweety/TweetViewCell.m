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

- (IBAction)onRetweet:(id)sender {
    self.tweet.retweeted = !self.tweet.retweeted;
    [self setButtonImages];
}

- (IBAction)onFavorite:(id)sender {
    self.tweet.favorited = !self.tweet.favorited;
    [self setButtonImages];
}

- (void)initWithTweet:(Tweet *)tweet {
    self.tweet = tweet;
    [self.tweetText setText:tweet.text];
    [self.realName setText:tweet.realName];
    [self.handle setText:[NSString stringWithFormat:@"@%@", tweet.handle]];
    [self.retweetCount setText:[tweet.retweetCount stringValue]];
    [self.favoriteCount setText:[tweet.favoriteCount stringValue]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-YYYY HH:mm:ss"];
    // [self.tweetTimestamp setText:[dateFormatter stringFromDate:tweet.createdAt]];
    // TODO
    // Fix the timestamp later
    [self.tweetTimestamp setText:@"100d ago"];
    
    [self.profileImage setImageWithURL:tweet.biggerImageURL];
    [self.profileImage.layer setCornerRadius:self.profileImage.frame.size.width / 2];
    self.profileImage.clipsToBounds = YES;
    self.profileImage.layer.borderWidth = 3.0f;
    self.profileImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    [self setButtonImages];
}

- (void)setButtonImages {
    UIImage* retweetImage = [UIImage imageNamed:@"retweet"];
    UIImage* retweetGrayImage = [UIImage imageNamed:@"retweet_gray"];

    UIImage* favImage = [UIImage imageNamed:@"favorite"];
    UIImage* favGrayImage = [UIImage imageNamed:@"favorite_gray"];
    
    if (self.tweet.retweeted) {
        [self.retweetButton setImage:retweetImage forState:UIControlStateNormal];
        [self.retweetButton setImage:retweetGrayImage forState:UIControlStateHighlighted];
        
    } else {
        [self.retweetButton setImage:retweetGrayImage forState:UIControlStateNormal];
        [self.retweetButton setImage:retweetImage forState:UIControlStateHighlighted];
    }
    
    if (self.tweet.favorited) {
        [self.favoriteButton setImage:favImage forState:UIControlStateNormal];
        [self.favoriteButton setImage:favGrayImage forState:UIControlStateHighlighted];
    } else {
        [self.favoriteButton setImage:favGrayImage forState:UIControlStateNormal];
        [self.favoriteButton setImage:favImage forState:UIControlStateHighlighted];
    }
}

@end
