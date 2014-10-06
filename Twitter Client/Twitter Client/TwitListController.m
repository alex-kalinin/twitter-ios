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
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TwitCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"TwitCell"];
    [cell display_twit_with_author:nil withName:nil withText:nil withDateText:nil];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_size_cell display_twit_with_author:nil withName:nil withText:nil withDateText:nil];
    CGSize size = [_size_cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"Height: %f", size.height);
    return size.height + 1;
}

-(void) new_twit
{
    
}

-(void) sign_out_click
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
