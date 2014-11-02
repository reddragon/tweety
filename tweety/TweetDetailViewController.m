//
//  TweetDetailViewController.m
//  tweety
//
//  Created by Gaurav Menghani on 10/28/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import "TweetDetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TwitterClient.h"

@interface TweetDetailViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) IBOutlet UILabel *tweetTimestamp;
@property (strong, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) Tweet* tweet;

- (IBAction)onFavorite:(id)sender;
- (IBAction)onRetweet:(id)sender;


@end

@implementation TweetDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.tweet) {
        [self.tweetText setText:self.tweet.text];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MM-YYYY HH:mm:ss"];
        [self.tweetTimestamp setText:[dateFormatter stringFromDate:self.tweet.createdAt]];
        
        [self.profileImage setImageWithURL:self.tweet.imageURL];
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id) initWithTweet:(Tweet*)tweet {
    if (tweet) {
        self.tweet = tweet;
    }
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onFavorite:(id)sender {
    NSDictionary* dict = [[NSDictionary alloc] initWithObjectsAndKeys:self.tweet.tId, @"id", nil];
    [[TwitterClient sharedInstance] favoriteWithParams:dict completion:nil destroy:false];
}

- (IBAction)onRetweet:(id)sender {
    NSDictionary* dict = [[NSDictionary alloc] initWithObjectsAndKeys:self.tweet.tId, @"id", nil];
    [[TwitterClient sharedInstance] retweetWithParams:dict completion:nil];
}
@end
