//
//  TweetsViewController.m
//  tweety
//
//  Created by Gaurav Menghani on 10/28/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import "TweetsViewController.h"
#import "TweetDetailViewController.h"
#import "User.h"
#import "TwitterClient.h"
#import "Tweet.h"
#import "TweetViewCell.h"
#import "ComposeViewController.h"

@interface TweetsViewController ()
- (IBAction)onLogout:(id)sender;
- (IBAction)onCompose:(id)sender;
@property (nonatomic, strong) UIRefreshControl* refreshControl;

@property (strong, nonatomic) NSArray* tweets;

@end

@implementation TweetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tweetList.delegate = self;
    self.tweetList.dataSource = self;
    [self.tweetList registerNib:[UINib nibWithNibName:@"TweetViewCell" bundle:nil] forCellReuseIdentifier:@"TweetViewCell"];
    self.tweetList.rowHeight = 100;
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    [self.tweetList insertSubview:self.refreshControl atIndex:0];
    
    [self loadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadData {
    [[TwitterClient sharedInstance] homeTimelineWithParams:nil completion:^(NSArray *tweets, NSError *error) {
        if (tweets != nil) {
            self.tweets = tweets;
            NSLog(@"Tweet List size: %ld", self.tweets.count);
            [self.tweetList reloadData];
        } else {
            NSLog(@"Error: %@", error);
        }
        [self.refreshControl endRefreshing];
    }];
}

- (void)onRefresh {
    NSLog(@"Refresh called");
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetViewCell* cell = [self.tweetList dequeueReusableCellWithIdentifier:@"TweetViewCell"];
    [cell initWithTweet:self.tweets[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TweetDetailViewController* tdvc = [[TweetDetailViewController alloc] initWithTweet:self.tweets[indexPath.row]];
    [self.navigationController pushViewController:tdvc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onLogout:(id)sender {
    [User logout];
}

- (IBAction)onCompose:(id)sender {
    NSLog(@"Hitting onCompose");
    ComposeViewController* cvc = [[ComposeViewController alloc] init];
    [self.navigationController pushViewController:cvc animated:YES];
}
@end
