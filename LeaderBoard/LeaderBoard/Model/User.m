//
//  Ranking.m
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import "User.h"

@implementation User

- (NSComparisonResult)compareRanking:(User*)otherObject {
    return self.rank < otherObject.rank;
}

@end
