//
//  Constans.h
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define TOP_VIEW_HEIGHT 60

#define TOP_ROUNDEDVIEW_WIDTH 304
#define TOP_ROUNDEDVIEW_HEIGHT 40

#define CHECK_BUTTON_WIDTH 100
#define CHECK_BUTTON_HEIGHT 38
#define CHECK_BUTTON_COLOR [UIColor whiteColor]
#define CHECKED_BUTTON_COLOR UIColorFromRGB(0x333333)
#define CHECK_BUTTON_TEXT_COLOR UIColorFromRGB(0x1A191A)
#define CHECK_BUTTON_FONT_SIZE 14
#define JosefinSansSemiBold @"JosefinSans-SemiBold"

#define CORNER_RADIUS 14.0f;

#define CONTENTVIEW_TOP_PADDING 8
#define CONTENTVIEW_H_PADDING 20

typedef enum{
    LEADERBOARD_THIS_WEEK,
    LEADERBOARD_ALL_TIME,
    LEADERBOARD_CATEGORIES
}LeaderBoardType;

extern NSString *const kLeaderboardThisWeek;
extern NSString *const kLeaderboardAllTime;
extern NSString *const kLeaderboardCategories;

@interface Constans : NSObject

@end
