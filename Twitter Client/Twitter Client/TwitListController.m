//
//  TwitListController.m
//  Twitter Client
//
//  Created by Alex Kalinin on 10/5/14.
//  Copyright (c) 2014 Alex Kalinin. All rights reserved.
//

#import "TwitListController.h"
#import "Twitter.h"
#import "Twit.h"
#import "TwitCell.h"
#import "LoginViewController.h"
#import "NewTwitController.h"
#import "TweetDetailController.h"

@interface TwitListController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TwitListController
{
    TwitCell*   _size_cell;
    UIRefreshControl* _refreshControl;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _refreshControl = [UIRefreshControl new];
    [_refreshControl addTarget:self action:@selector(refresh_on_pull) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:_refreshControl];
    
    [[Twitter instance] load:^{
        [_refreshControl endRefreshing];
        [self.tableView reloadData];
    }];

    self.title = @"Home";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Sign Out"
                                                                            style:UIBarButtonItemStylePlain target:self
                                                                           action:@selector(sign_out_click)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"New"
                                                                            style:UIBarButtonItemStylePlain target:self
                                                                           action:@selector(new_twit)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TwitCell" bundle:nil]
         forCellReuseIdentifier:@"TwitCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _size_cell = [self.tableView dequeueReusableCellWithIdentifier:@"TwitCell"];
}
//------------------------------------------------------------------------------
-(void) reload {
    [[Twitter instance] reload:^{
        [_refreshControl endRefreshing];
        [self.tableView reloadData];
    }];
}
//------------------------------------------------------------------------------
-(void)refresh_on_pull
{
    [self reload];
}
//------------------------------------------------------------------------------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Twitter instance].twit_count;
}
//------------------------------------------------------------------------------
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TwitCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"TwitCell"];
    Twit* twit = [[Twitter instance] twit_at_index:indexPath.row];
    [twit display:cell];
    return cell;
}
//------------------------------------------------------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Twit* twit = [[Twitter instance] twit_at_index:indexPath.row];
    _size_cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.bounds), 0.0f);
    [twit display:_size_cell];
    CGSize size = [_size_cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}
//------------------------------------------------------------------------------
-(void) new_twit
{
    NewTwitController* c = [NewTwitController new];
    c.delegate = self;
    [c set_user:User.currentUser];
    [self.navigationController pushViewController:c animated:YES];
}
//------------------------------------------------------------------------------
-(void)new_twit_controller_done:(NewTwitController *)twc withText:(NSString *)text
{
    [[Twitter instance] twit_with_text:text success:^(Twit* new_twit) {
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }];
}
//------------------------------------------------------------------------------
-(void) sign_out_click
{
    [[Twitter instance] sign_out];
    UIViewController* controller = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [self presentViewController:controller animated:YES completion:nil];
}
//------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//------------------------------------------------------------------------------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TweetDetailController* td = [TweetDetailController new];
    td.delegate = self;
    Twit* twit = [[Twitter instance] twit_at_index:indexPath.row];
    [td set_tweet:twit];
    [self.navigationController pushViewController:td animated:YES];
    
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
}
//------------------------------------------------------------------------------
-(void)tweet_detail_controller_done:(TweetDetailController *)td
{
    
}
@end
