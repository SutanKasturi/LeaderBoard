//
//  Ranking.h
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger rank;

- (NSComparisonResult)compareRanking:(User*)otherObject;

@end
