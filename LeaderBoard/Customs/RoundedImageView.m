//
//  RoundedImageView.m
//  2B1S
//
//  Created by Cui on 9/2/14.
//  Copyright (c) 2014 Cui. All rights reserved.
//

#import "RoundedImageView.h"

@interface RoundedImageView()

- (void) draw;

@end

@implementation RoundedImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _cornerRadius = self.frame.size.height/2.0f;
        [self draw];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if ( self ) {
        _borderWidth = -1.0;
        _cornerRadius = self.frame.size.height/2.0f;
        [self draw];
    }
    
    return self;
}

- (id) initWithFrame:(CGRect)frame borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth {
    self = [super initWithFrame:frame];
    if ( self ) {
        _borderColor = borderColor;
        _borderWidth = borderWidth;
        _cornerRadius = self.frame.size.height/2.0f;
        [self draw];
    }
    return self;
}

- (id) initWithImage:(UIImage *)image borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth {
    self = [super initWithImage:image];
    if ( self ) {
        _borderColor = borderColor;
        _borderWidth = borderWidth;
        _cornerRadius = self.frame.size.height/2.0f;
        [self draw];
    }
    return self;
}

- (id) initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth {
    self = [super initWithImage:image];
    if ( self ) {
        _borderColor = borderColor;
        _borderWidth = borderWidth;
        _cornerRadius = self.frame.size.height/2.0f;
        [self draw];
    }
    return self;
}

- (void) setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    [self draw];
}

- (void) setBorderWidth:(float)borderWidth {
    _borderWidth = borderWidth;
    [self draw];
}

- (void) setCornerRadius:(float)cornerRadius {
    _cornerRadius = cornerRadius;
    [self draw];
}

- (void) draw {
    CGRect frame = self.frame;
    if ( frame.size.width != frame.size.height ) {
        NSLog(@"Warning: Height and Width should be the same for image view");
    }
    
    CALayer *l = [self layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:_cornerRadius];
    if ( _borderWidth < 0 ) { // Default case
        [l setBorderWidth:0.0f];
    }
    else {
        [l setBorderWidth:_borderWidth];
    }
    
    if ( _borderColor == nil ) {
        [l setBorderColor:[[UIColor blueColor] CGColor]];
    }
    else {
        [l setBorderColor:[_borderColor CGColor]];
    }
}

@end
