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

@interface TwitListController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TwitListController
{
    Twitter*    _twitter;
    TwitCell*   _size_cell;
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
    
    [[Twitter instance] load:^{
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
    
    _twitter = [Twitter new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _size_cell = [self.tableView dequeueReusableCellWithIdentifier:@"TwitCell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Twitter instance].twit_count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TwitCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"TwitCell"];
    Twit* twit = [[Twitter instance] twit_at_index:indexPath.row];
    [twit display:cell];
//    [cell display_twit_with_author:nil withName:nil withText:nil withDateText:nil];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Twit* twit = [[Twitter instance] twit_at_index:indexPath.row];
    _size_cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.bounds), 0.0f);
    [twit display:_size_cell];
    CGSize size = [_size_cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"Height: %f", size.height);
    return size.height;
}

-(void) new_twit
{
    
}

-(void) sign_out_click
{
    [[Twitter instance] sign_out];
    UIViewController* controller = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
