//
//  CheckButton.h
//  FIX
//
//  Created by Admin on 9/11/14.
//  Copyright (c) 2014 gmc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoundedButton.h"

@interface CheckButton : RoundedButton;

@property (nonatomic, assign) BOOL isChecked;

- (void) setState:(BOOL)isCheck;

@end
