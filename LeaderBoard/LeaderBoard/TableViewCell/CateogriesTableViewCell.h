//
//  CateogriesTableViewCell.h
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoundedImageView.h"
#import "Categories.h"
#import "EffectButton.h"

@class CateogriesTableViewCell;

@protocol CateogriesTableViewCellDelegate <NSObject>

@required
- (void) didLiked:(CateogriesTableViewCell*)cell;

@end


@interface CateogriesTableViewCell : UITableViewCell

@property (weak, nonatomic) id<CateogriesTableViewCellDelegate> delegate;

@property (nonatomic, strong) Categories *category;

@property (strong, nonatomic) UILabel *lblTitle;
@property (strong, nonatomic) UILabel *lblLikeCount;
@property (strong, nonatomic) UIImageView *ivLikeImage;
@property (strong, nonatomic) UIImageView *ivCategoryImage;
@property (strong, nonatomic) RoundedImageView *ivUserImage;
@property (strong, nonatomic) UILabel *lblUserName;
@property (strong, nonatomic) EffectButton *btnLike;

@end
