//
//  TweetViewCell.h
//  tweety
//
//  Created by Gaurav Menghani on 10/28/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) Tweet* tweet;
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) IBOutlet UILabel *tweetTimestamp;

- (void)initWithTweet:(Tweet*)tweet;
@end
