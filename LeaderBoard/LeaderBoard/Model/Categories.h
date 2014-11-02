//
//  Catorories.h
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Categories : NSObject

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger likeCount;
@property (nonatomic, strong) NSString *imagePath;

@end
