//
//  RankingTableViewController.m
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import "RankingViewController.h"
#import "RankingHeaderTableViewCell.h"
#import "RankingTableViewCell.h"
#import "Constans.h"
#import "User.h"

@interface RankingViewController ()

@property (nonatomic, strong) NSMutableArray *rankingArray;
@property (nonatomic, assign) NSInteger currentUserId;
@property (nonatomic, assign) NSInteger currentUserNumber;
@end

@implementation RankingViewController

@synthesize rankingArray = _rankingArray;
@synthesize currentUserId;
@synthesize currentUserNumber;

-(NSMutableArray*)rankingArray
{
    if ( _rankingArray == nil ) {
        NSArray *names = [[NSArray alloc] initWithObjects:@"SELENA", @"KRISTA", @"WYATT", @"DARIUS", @"AUDREY", @"JOCELYN", @"XAVIER", @"KYLIE", @"ALEC", @"PHILIP", @"MICHAEL", nil];
        int count = (int)[names count];
        if ( self.rankingType == LEADERBOARD_THIS_WEEK ) {
            currentUserNumber = 8;
        }
        else {
            currentUserNumber = 23;
            count = 3 * count;
        }
        
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        for ( int i = 0; i < count; i++ )
        {
            User *theUser = [[User alloc] init];
            theUser.userId = i + 1;
            theUser.name = names[i % 11];
            theUser.imagePath = [NSString stringWithFormat:@"user%d.png", (i % 10) + 1];
            theUser.rank = arc4random() % 100000;
            [tempArray addObject:theUser];
        }
        NSArray *sortedArray = [tempArray sortedArrayUsingSelector:@selector(compareRanking:)];
        _rankingArray = [[NSMutableArray alloc] initWithArray:sortedArray];
    }
    return _rankingArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setupViews];
}

#pragma mark - Setup View

- (void) setupViews
{
    self.tableView = [UITableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    
    // 1. Create a dictionary of views
    NSDictionary *viewsDictionary = @{@"tableView":self.tableView};
    
    // 2. Define the views Positions
    
    NSArray *tableview_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[tableView]-0-|"
                                                                                options:0
                                                                                metrics:nil
                                                                                  views:viewsDictionary];
    
    NSArray *tableview_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|"
                                                                                options:0
                                                                                metrics:nil
                                                                                  views:viewsDictionary];
    
    [self.view addConstraints:tableview_constraint_POS_V];
    [self.view addConstraints:tableview_constraint_POS_H];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self rankingArray] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RankingHeaderTableViewCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"RankingHeaderTableViewCell"];
    if ( headerCell == nil ) {
        headerCell = [[RankingHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RankingHeaderTableViewCell"];
    }
    return headerCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RankingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RankingTableViewCell"];
    if ( cell == nil ) {
        cell = [[RankingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RankingTableViewCell"];
    }
    
    cell.lblNumber.text = [NSString stringWithFormat:@"%d.", (int)(indexPath.row + 1)];
    
    User *theUser = [self rankingArray][indexPath.row];
    cell.ivImage.image = [UIImage imageNamed:theUser.imagePath];
    cell.lblName.text = theUser.name;
    
    NSNumberFormatter *frmtr = [[NSNumberFormatter alloc] init];
    [frmtr setGroupingSize:3];
    [frmtr setGroupingSeparator:@","];
    [frmtr setUsesGroupingSeparator:YES];
    cell.lblRank.text = [frmtr stringFromNumber:[NSNumber numberWithInteger:theUser.rank]];
    
    UIColor *color;
    if ( currentUserNumber == indexPath.row ) {
        color = UIColorFromRGB(0xc1272d);
    }
    else {
        color = UIColorFromRGB(0x1a1a1a);
    }
    [cell.lblName setTextColor:color];
    [cell.lblNumber setTextColor:color];
    [cell.lblRank setTextColor:color];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
