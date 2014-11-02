//
//  CheckButton.m
//  FIX
//
//  Created by Admin on 9/11/14.
//  Copyright (c) 2014 gmc. All rights reserved.
//

#import "CheckButton.h"
#import "Constans.h"

@implementation CheckButton

#define CHECK_MARK [UIImage imageNamed:@"icon_check.png"]

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
//        [self setBorderColor:CHECKED_BUTTON_COLOR];
//        [self setBorderWidth:1.0f];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if ( self ) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
//        [self setBorderColor:CHECKED_BUTTON_COLOR];
//        [self setBorderWidth:1.0f];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) setState:(BOOL)isCheck {
    if ( isCheck == YES )
        _isChecked = NO;
    else
        _isChecked = YES;
    [self clicked];
}

- (void) clicked {
    if ( _isChecked == YES ) {
        _isChecked = NO;
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setTitleColor:CHECKED_BUTTON_COLOR forState:UIControlStateNormal];
    }
    else {
        _isChecked = YES;
        [self setBackgroundColor:CHECKED_BUTTON_COLOR];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

@end
