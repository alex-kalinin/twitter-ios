//
//  TweetDetailController.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/8/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "TweetDetailController.h"
#import "TwitDetailCell.h"
#import "TweetDetailRetweetsCell.h"
#import "DetailButtonsCell.h"

@interface TweetDetailController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
//------------------------------------------------------------------------------
@implementation TweetDetailController
{
    Twit*   _tweet;
}
//------------------------------------------------------------------------------
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TwitDetailCell" bundle:nil]
         forCellReuseIdentifier:@"TwitDetailCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TweetDetailRetweetsCell" bundle:nil]
         forCellReuseIdentifier:@"TweetDetailRetweetsCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailButtonsCell" bundle:nil]
         forCellReuseIdentifier:@"DetailButtonsCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
//------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//------------------------------------------------------------------------------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
//------------------------------------------------------------------------------
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self create_cell:indexPath];
}
//------------------------------------------------------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2)
        return 44;
    
    UITableViewCell* cell = [self create_cell:indexPath];
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1;
}
//------------------------------------------------------------------------------
-(UITableViewCell*) create_cell:(NSIndexPath*)indexPath
{
    UITableViewCell* result;
    
    if (indexPath.row == 0)      result = [self.tableView dequeueReusableCellWithIdentifier:@"TwitDetailCell"];
    else if (indexPath.row == 1) result = [self.tableView dequeueReusableCellWithIdentifier:@"TweetDetailRetweetsCell"];
    else if (indexPath.row == 2) result = [self.tableView dequeueReusableCellWithIdentifier:@"DetailButtonsCell"];

    [_tweet display:(id<TwitView>)result];
    
    return result;
}
//------------------------------------------------------------------------------
-(void)set_tweet:(Twit *)twit
{
    _tweet = twit;
}
//------------------------------------------------------------------------------
-(void)viewWillDisappear:(BOOL)animated
{
    [self.delegate tweet_detail_controller_done:self withTweet:_tweet];
}
@end
