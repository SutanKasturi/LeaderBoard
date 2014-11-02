//
//  CateogriesTableViewCell.m
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import "CateogriesTableViewCell.h"
#import "Constans.h"

@implementation CateogriesTableViewCell


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
    self.lblTitle = [UILabel new];
    self.lblTitle.translatesAutoresizingMaskIntoConstraints = NO;
    self.lblTitle.font = [UIFont fontWithName:@"Salsa-Regular" size:24.0f];
    self.lblTitle.backgroundColor = [UIColor colorWithRed:0.55 green:0.52 blue:0.79 alpha:0.6];
    self.lblTitle.textAlignment = NSTextAlignmentCenter;
    
    self.lblLikeCount = [UILabel new];
    self.lblLikeCount.translatesAutoresizingMaskIntoConstraints = NO;
    self.lblLikeCount.font = [UIFont fontWithName:@"Salsa-Regular" size:20.0f];
    self.lblLikeCount.textAlignment = NSTextAlignmentCenter;
    
    self.ivLikeImage = [UIImageView new];
    self.ivLikeImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.ivLikeImage.image = [UIImage imageNamed:@"categories_hand.png"];
    self.ivLikeImage.contentMode = UIViewContentModeCenter;
    
    self.ivCategoryImage = [UIImageView new];
    self.ivCategoryImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.ivCategoryImage.contentMode = UIViewContentModeScaleAspectFit;
    self.ivCategoryImage.backgroundColor = [UIColor clearColor];
    
    self.ivUserImage = [RoundedImageView new];
    self.ivUserImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.lblUserName = [UILabel new];
    self.lblUserName.translatesAutoresizingMaskIntoConstraints = NO;
    self.lblUserName.font = [UIFont fontWithName:JosefinSansSemiBold size:18.0f];
    self.lblUserName.textAlignment = NSTextAlignmentCenter;
    
    self.btnLike = [EffectButton new];
    self.btnLike.translatesAutoresizingMaskIntoConstraints = NO;
    [self.btnLike setImage:[UIImage imageNamed:@"like.png"] forState:UIControlStateNormal];
    
    [self.contentView addSubview:self.lblTitle];
    [self.contentView addSubview:self.lblLikeCount];
    [self.contentView addSubview:self.ivLikeImage];
    [self.contentView addSubview:self.ivCategoryImage];
    [self.contentView addSubview:self.ivUserImage];
    [self.contentView addSubview:self.lblUserName];
    [self.contentView addSubview:self.btnLike];
    
    // 1. Create a dictionary of views
    NSDictionary *viewsDictionary = @{@"lblTitle":self.lblTitle,
                                      @"lblLikeCount":self.lblLikeCount,
                                      @"ivLikeImage":self.ivLikeImage,
                                      @"ivCategoryImage":self.ivCategoryImage,
                                      @"ivUserImage":self.ivUserImage,
                                      @"lblUserName":self.lblUserName,
                                      @"btnLike":self.btnLike};
    NSDictionary *metrics = @{@"titleHeight":@41,
                              @"likeCountLabelHeight":@34,
                              @"likeCountLabelWidth": @49,
                              @"likeImageWidth":@36,
                              @"userImageSize":@54,
                              @"cateogryImageTopPadding":@40,
                              @"categoryImageBottomPadding":@74,
                              @"padding":@8,
                              @"likeButtonWidth":@83,
                              @"likeButtonHeight":@44,
                              @"likeButtonBottomPadding":@21,
                              @"bottomPadding":@16};
    
    // 2. Define the views sizes
    
    NSArray *title_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lblTitle(titleHeight)]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    [self.lblTitle addConstraints:title_constraint_V];
    
    NSArray *likeCount_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[lblLikeCount(likeCountLabelWidth)]"
                                                                          options:0
                                                                          metrics:metrics
                                                                            views:viewsDictionary];
    NSArray *likeCount_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lblLikeCount(likeCountLabelHeight)]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    [self.lblLikeCount addConstraints:likeCount_constraint_V];
    [self.lblLikeCount addConstraints:likeCount_constraint_H];

    NSArray *likeImage_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[ivLikeImage(likeImageWidth)]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    [self.ivLikeImage addConstraints:likeImage_constraint_H];
    
    NSArray *userImage_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[ivUserImage(userImageSize)]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    NSArray *userImage_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[ivUserImage(userImageSize)]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    [self.ivUserImage addConstraints:userImage_constraint_V];
    [self.ivUserImage addConstraints:userImage_constraint_H];

    NSArray *likeButton_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[btnLike(likeButtonWidth)]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    NSArray *likeButton_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[btnLike(likeButtonHeight)]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    [self.btnLike addConstraints:likeButton_constraint_V];
    [self.btnLike addConstraints:likeButton_constraint_H];

    NSArray *userName_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lblUserName(userImageSize)]"
                                                                               options:0
                                                                               metrics:metrics
                                                                                 views:viewsDictionary];
    
    [self.lblUserName addConstraints:userName_constraint_V];
    
    // 3. Define the views Positions
    
    NSArray *title_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lblTitle]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    NSArray *title_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[lblTitle]-0-|"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    [self.contentView addConstraints:title_constraint_POS_V];
    [self.contentView addConstraints:title_constraint_POS_H];

    NSArray *likeCount_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lblLikeCount]-0-[ivCategoryImage]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    NSArray *likeCount_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[lblLikeCount]-padding-|"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    [self.contentView addConstraints:likeCount_constraint_POS_V];
    [self.contentView addConstraints:likeCount_constraint_POS_H];

    NSArray *likeImage_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[ivLikeImage]-0-[ivCategoryImage]"
                                                                                  options:0
                                                                                  metrics:metrics
                                                                                    views:viewsDictionary];
    
    NSArray *likeImage_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[ivLikeImage]-padding-[lblLikeCount]"
                                                                                  options:0
                                                                                  metrics:metrics
                                                                                    views:viewsDictionary];
    
    [self.contentView addConstraints:likeImage_constraint_POS_V];
    [self.contentView addConstraints:likeImage_constraint_POS_H];

    NSArray *category_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-cateogryImageTopPadding-[ivCategoryImage]-categoryImageBottomPadding-|"
                                                                                  options:0
                                                                                  metrics:metrics
                                                                                    views:viewsDictionary];
    
    NSArray *category_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[ivCategoryImage]-0-|"
                                                                                  options:0
                                                                                  metrics:metrics
                                                                                    views:viewsDictionary];
    
    [self.contentView addConstraints:category_constraint_POS_V];
    [self.contentView addConstraints:category_constraint_POS_H];
    
    NSArray *userImage_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[ivUserImage]-bottomPadding-|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:viewsDictionary];
    
    NSArray *userImage_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-padding-[ivUserImage]"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:viewsDictionary];
    
    [self.contentView addConstraints:userImage_constraint_POS_V];
    [self.contentView addConstraints:userImage_constraint_POS_H];
    
    NSArray *likeButton_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[btnLike]-likeButtonBottomPadding-|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:viewsDictionary];
    
    NSArray *likeButton_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[btnLike]-padding-|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:viewsDictionary];
    
    [self.contentView addConstraints:likeButton_constraint_POS_V];
    [self.contentView addConstraints:likeButton_constraint_POS_H];
    
    NSArray *userName_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lblUserName]-bottomPadding-|"
                                                                                  options:0
                                                                                  metrics:metrics
                                                                                    views:viewsDictionary];
    
    NSArray *userName_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[ivUserImage]-padding-[lblUserName]-padding-[btnLike]"
                                                                                  options:0
                                                                                  metrics:metrics
                                                                                    views:viewsDictionary];
    
    [self.contentView addConstraints:userName_constraint_POS_V];
    [self.contentView addConstraints:userName_constraint_POS_H];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


- (IBAction)onLikeButton:(id)sender {
//    self.category.likeCount++;
//    self.lblLikeCount.text = [NSString stringWithFormat:@"%d", (int)self.category.likeCount];
    [self.delegate didLiked:self];
}

@end
