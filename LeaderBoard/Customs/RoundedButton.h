//
//  RoundedButton.h
//  FIX
//
//  Created by Admin on 9/11/14.
//  Copyright (c) 2014 gmc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EffectButton.h"

typedef enum
{
    NONE = 0,
    LEFT_CORNER = 1,
    RIGHT_CORNER = 2
}RoundType;

@interface RoundedButton : EffectButton

@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic, retain) UIColor *backgroundColor;
@property (nonatomic, assign) float borderWidth;
@property (nonatomic, assign) float cornerRadius;
@property (nonatomic, assign) NSInteger cornerType;

- (void) draw;

@end
