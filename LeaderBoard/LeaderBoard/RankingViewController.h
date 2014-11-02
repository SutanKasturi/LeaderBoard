//
//  RankingTableViewController.h
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankingViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, setter=setRankingType:) NSInteger rankingType;
@property (strong, nonatomic) UITableView *tableView;

@end
