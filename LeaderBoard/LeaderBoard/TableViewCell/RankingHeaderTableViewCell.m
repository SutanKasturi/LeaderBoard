//
//  RankingHeaderTableViewCell.m
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import "RankingHeaderTableViewCell.h"
#import "Constans.h"

@implementation RankingHeaderTableViewCell

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
    [self setupViews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Setup View

- (void) setupViews
{
    self.rankingLabel = [UILabel new];
    self.rankingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.rankingLabel.backgroundColor = UIColorFromRGB(0x004A97);
    self.rankingLabel.text = @"RANKING";
    self.rankingLabel.textColor = [UIColor whiteColor];
    self.rankingLabel.font = [UIFont fontWithName:JosefinSansSemiBold size:18.0f];
    self.rankingLabel.textAlignment = NSTextAlignmentCenter;
    
    self.rankingImageView = [UIImageView new];
    self.rankingImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.rankingImageView.backgroundColor = UIColorFromRGB(0x22B573);
    self.rankingImageView.image = [UIImage imageNamed:@"ranking_hand.png"];
    self.rankingImageView.contentMode = UIViewContentModeCenter;
    
    [self.contentView addSubview:self.rankingLabel];
    [self.contentView addSubview:self.rankingImageView];
    
    // 1. Create a dictionary of views
    NSDictionary *viewsDictionary = @{@"contentView":self.contentView, @"rankingLabel":self.rankingLabel, @"rankingImageView":self.rankingImageView};
    NSDictionary *metrics = @{@"imageViewWidth": @80};
    
    // 2. Define the views Positions
    
    NSArray *imageView_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[rankingImageView(imageViewWidth)]"
                                                                            options:0
                                                                            metrics:metrics
                                                                              views:viewsDictionary];
    
    [self.rankingImageView addConstraints:imageView_constraint_V];
    
    NSArray *label_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[rankingLabel]-0-|"
                                                                                options:0
                                                                                metrics:metrics
                                                                                  views:viewsDictionary];
    
    NSArray *label_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[rankingLabel]-imageViewWidth-|"
                                                                                options:0
                                                                                metrics:metrics
                                                                                  views:viewsDictionary];
    
    [self.contentView addConstraints:label_constraint_POS_V];
    [self.contentView addConstraints:label_constraint_POS_H];
    
    NSArray *imageview_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[rankingImageView]-0-|"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    NSArray *imageview_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[rankingImageView]-0-|"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    [self.contentView addConstraints:imageview_constraint_POS_V];
    [self.contentView addConstraints:imageview_constraint_POS_H];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
