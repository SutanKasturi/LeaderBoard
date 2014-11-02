//
//  RoundedButton.m
//  FIX
//
//  Created by Admin on 9/11/14.
//  Copyright (c) 2014 gmc. All rights reserved.
//

#import "RoundedButton.h"
#import "Constans.h"

@implementation RoundedButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _cornerRadius = CORNER_RADIUS;//self.frame.size.height / 3.0f;
        [self draw];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if ( self ) {
        _borderWidth = -1.0f;
        _cornerRadius = CORNER_RADIUS;//self.frame.size.height / 3.0f;
        [self draw];
    }
    return self;
}

- (void) setBorderWidth:(float)borderWidth {
    _borderWidth = borderWidth;
    [self draw];
}

- (void) setCornerRadius:(float)cornerRadius {
    _cornerRadius = cornerRadius;
    [self draw];
}

- (void) setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    [self draw];
}

- (void) setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
//    [self draw];
    CALayer *layer = [self layer];
    [layer setMasksToBounds:YES];
    
    if ( _backgroundColor == nil )
    _backgroundColor = [UIColor whiteColor];
    [layer setBackgroundColor:[_backgroundColor CGColor]];
}

- (void) setCornerType:(NSInteger)cornerType
{
    _cornerType = cornerType;
    [self draw];
}

- (void) draw {
//    CGRect frame = self.frame;
    
//    if ( frame.size.width != frame.size.height ) {
//        NSLog(@"Warning: Height and Width should be the same for view");
//    }
    
    CALayer *layer = [self layer];
    [layer setMasksToBounds:YES];
    
    if ( _backgroundColor == nil )
        _backgroundColor = [UIColor whiteColor];
    [layer setBackgroundColor:[_backgroundColor CGColor]];
    
    if ( _borderWidth < 0 )
        _borderWidth = 0.0f;
    [layer setBorderWidth:_borderWidth];
    
    if ( _borderColor == nil ) {
        [layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    } else {
        [layer setBorderColor:[_borderColor CGColor]];
    }
    
    if ( _cornerType == LEFT_CORNER || _cornerType == RIGHT_CORNER ) {
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        UIBezierPath *bezierPath;
        if ( _cornerType == LEFT_CORNER ) {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft) cornerRadii:CGSizeMake(_cornerRadius, _cornerRadius)];
        }
        else {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight) cornerRadii:CGSizeMake(_cornerRadius, _cornerRadius)];
        }
        maskLayer.frame = self.bounds;
        maskLayer.path = bezierPath.CGPath;
        maskLayer.fillColor = _backgroundColor.CGColor;
        [self.layer setMask:maskLayer];
    }
}

@end
