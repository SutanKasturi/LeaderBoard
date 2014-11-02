//
//  RoundedImageView.h
//  2B1S
//
//  Created by Cui on 9/2/14.
//  Copyright (c) 2014 Cui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundedImageView : UIImageView

@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic, assign) float borderWidth;
@property (nonatomic, assign) float cornerRadius;

- (id) initWithFrame:(CGRect)frame borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth;
- (id) initWithImage:(UIImage*)image borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth;
- (id) initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth;

@end
