//
//  CategoriesTableViewController.m
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import "CategoriesViewController.h"
#import "CateogriesTableViewCell.h"
#import "Categories.h"

@interface CategoriesViewController ()<CateogriesTableViewCellDelegate>

@property (nonatomic, strong) NSMutableArray *categories;

@end

@implementation CategoriesViewController

@synthesize categories = _categories;

-(NSMutableArray *)categories
{
    if ( _categories == nil ) {
        _categories = [[NSMutableArray alloc] init];
        
        Categories *theCategory1 = [[Categories alloc] init];
        
        User *theUser1 = [[User alloc] init];
        theUser1.name = @"APRIL";
        theUser1.imagePath = @"user1.png";
        
        theCategory1.user = theUser1;
        theCategory1.title = @"A Wild Night";
        theCategory1.likeCount = 189;
        theCategory1.imagePath = @"category1.png";
        [_categories addObject:theCategory1];
        
        Categories *theCategory2 = [[Categories alloc] init];
        
        User *theUser2 = [[User alloc] init];
        theUser2.name = @"KRISTA";
        theUser2.imagePath = @"user2.png";
        
        theCategory2.user = theUser2;
        theCategory2.title = @"I Was Here";
        theCategory2.imagePath = @"category2.png";
        theCategory2.likeCount = 45;
        [_categories addObject:theCategory2];
    }
    return _categories;
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
    return [[self categories] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Categories *theCategory = [self categories][indexPath.row];
    UIImage *image = [UIImage imageNamed:theCategory.imagePath];
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    return 115.0f + height / width * self.tableView.frame.size.width - 2.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CateogriesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CateogriesTableViewCell"];
    if ( cell == nil ) {
        cell = [[CateogriesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CateogriesTableViewCell"];
    }
    
    cell.delegate = self;
    Categories *theCategory = [self categories][indexPath.row];
    cell.lblTitle.text = theCategory.title;
    cell.lblLikeCount.text = [NSString stringWithFormat:@"%d", (int)theCategory.likeCount];
    cell.ivCategoryImage.image = [UIImage imageNamed:theCategory.imagePath];
    cell.category = theCategory;
    cell.ivUserImage.image = [UIImage imageNamed:theCategory.user.imagePath];
    cell.lblUserName.text = theCategory.user.name;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - CategoriesFooterTableViewCellDelegate

-(void)didLiked:(CateogriesTableViewCell *)cell
{
}

@end
