//
//  RoundedLabel.m
//  FIX
//
//  Created by Admin on 9/11/14.
//  Copyright (c) 2014 gmc. All rights reserved.
//

#import "RoundedLabel.h"

@implementation RoundedLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _cornerRadius = self.frame.size.height / 2.0f;
        [self draw];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if ( self ) {
        _borderWidth = -1.0f;
        _cornerRadius = self.frame.size.height / 2.0f;
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
    [self draw];
}

- (void) draw {
    //    CGRect frame = self.frame;
    
    //    if ( frame.size.width != frame.size.height ) {
    //        NSLog(@"Warning: Height and Width should be the same for view");
    //    }
    
    CALayer *layer = [self layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:_cornerRadius];
    if ( _backgroundColor == nil ) {
//        [layer setBackgroundColor:[[UIColor blackColor] CGColor]];
        [super setBackgroundColor:[UIColor blackColor]];
    } else {
//        [layer setBackgroundColor:[_backgroundColor CGColor]];
        [super setBackgroundColor:_backgroundColor];
    }
    
    if ( _borderWidth < 0 ) {
        [layer setBorderWidth:3.0f];
    }
    else {
        [layer setBorderWidth:_borderWidth];
    }
    
    if ( _borderColor == nil ) {
        [layer setBorderColor:[[UIColor clearColor] CGColor]];
    } else {
        [layer setBorderColor:[_borderColor CGColor]];
    }
}


@end
