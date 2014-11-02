//
//  RankingTableViewCell.h
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoundedImageView.h"

@interface RankingTableViewCell : UITableViewCell

@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) UILabel *lblNumber;
@property (strong, nonatomic) RoundedImageView *ivImage;
@property (strong, nonatomic) UILabel *lblName;
@property (strong, nonatomic) UILabel *lblRank;

@end
