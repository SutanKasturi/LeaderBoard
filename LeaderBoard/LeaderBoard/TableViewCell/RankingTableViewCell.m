//
//  RankingTableViewCell.m
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import "RankingTableViewCell.h"
#import "Constans.h"

@implementation RankingTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self ) {
        [self setupViews];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if ( self ) {
        [self setupViews];
    }
    
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - Setup View

- (void) setupViews
{
    self.containerView = [UIView new];
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.containerView.backgroundColor = [UIColor colorWithRed:0 green:0.29 blue:0.59 alpha:0.2];
    
    self.lblNumber = [UILabel new];
    self.lblNumber.translatesAutoresizingMaskIntoConstraints = NO;
    self.lblNumber.textColor = UIColorFromRGB(0x1A1A1A);
    self.lblNumber.font = [UIFont fontWithName:JosefinSansSemiBold size:18.0f];
    self.lblNumber.textAlignment = NSTextAlignmentCenter;
    
    self.ivImage = [RoundedImageView new];
    self.ivImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.lblName = [UILabel new];
    self.lblName.translatesAutoresizingMaskIntoConstraints = NO;
    self.lblName.font = [UIFont fontWithName:JosefinSansSemiBold size:18.0f];
    
    [self.containerView addSubview:self.lblNumber];
    [self.containerView addSubview:self.ivImage];
    [self.containerView addSubview:self.lblName];
    
    self.lblRank = [UILabel new];
    self.lblRank.translatesAutoresizingMaskIntoConstraints = NO;
    self.lblRank.font = [UIFont fontWithName:JosefinSansSemiBold size:18.0f];
    self.lblRank.backgroundColor = [UIColor colorWithRed:0.13 green:0.71 blue:0.45 alpha:0.2];
    self.lblRank.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:self.containerView];
    [self.contentView addSubview:self.lblRank];
   
    // 1. Create a dictionary of views
    NSDictionary *viewsDictionary = @{@"containerView":self.containerView,
                                      @"lblNumber":self.lblNumber,
                                      @"ivImage":self.ivImage,
                                      @"lblName":self.lblName,
                                      @"lblRank":self.lblRank};
    NSDictionary *metrics = @{@"hPadding": @3,
                              @"vPadding": @8,
                              @"imagePadding": @2,
                              @"rankWidth": @80,
                              @"imageSize": @54,
                              @"numberWidth": @50};
    
    // 2. Define the views sizes
    
    NSArray *rank_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[lblRank(rankWidth)]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    [self.lblRank addConstraints:rank_constraint_V];

    NSArray *image_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[ivImage(imageSize)]"
                                                                         options:0
                                                                         metrics:metrics
                                                                           views:viewsDictionary];
    NSArray *image_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[ivImage(imageSize)]"
                                                                          options:0
                                                                          metrics:metrics
                                                                            views:viewsDictionary];
    
    [self.ivImage addConstraints:image_constraint_V];
    [self.ivImage addConstraints:image_constraint_H];
    
    NSArray *number_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[lblNumber(numberWidth)]"
                                                                           options:0
                                                                           metrics:metrics
                                                                             views:viewsDictionary];
    
    [self.lblNumber addConstraints:number_constraint_V];
    
    // 3. Define the views positions
    
    NSArray *containerView_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[containerView]-0-|"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    NSArray *containerView_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[containerView]-rankWidth-|"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    [self.contentView addConstraints:containerView_constraint_POS_V];
    [self.contentView addConstraints:containerView_constraint_POS_H];
    
    NSArray *rank_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lblRank]-0-|"
                                                                             options:0
                                                                             metrics:metrics
                                                                               views:viewsDictionary];
    
    NSArray *rank_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[lblRank]-0-|"
                                                                             options:0
                                                                             metrics:metrics
                                                                               views:viewsDictionary];
    
    [self.contentView addConstraints:rank_constraint_POS_V];
    [self.contentView addConstraints:rank_constraint_POS_H];
    
    NSArray *number_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-hPadding-[lblNumber]-hPadding-|"
                                                                                  options:0
                                                                                  metrics:metrics
                                                                                    views:viewsDictionary];
    
    NSArray *number_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-vPadding-[lblNumber]"
                                                                                  options:0
                                                                                  metrics:metrics
                                                                                    views:viewsDictionary];
    
    [self.containerView addConstraints:number_constraint_POS_V];
    [self.containerView addConstraints:number_constraint_POS_H];
    
    NSArray *image_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-hPadding-[ivImage]-hPadding-|"
                                                                               options:0
                                                                               metrics:metrics
                                                                                 views:viewsDictionary];
    
    NSArray *image_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[lblNumber]-imagePadding-[ivImage]"
                                                                               options:0
                                                                               metrics:metrics
                                                                                 views:viewsDictionary];
    
    [self.containerView addConstraints:image_constraint_POS_V];
    [self.containerView addConstraints:image_constraint_POS_H];
    
    NSArray *name_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-hPadding-[lblName]-hPadding-|"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    NSArray *name_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[ivImage]-vPadding-[lblName]-vPadding-|"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    [self.containerView addConstraints:name_constraint_POS_V];
    [self.containerView addConstraints:name_constraint_POS_H];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
