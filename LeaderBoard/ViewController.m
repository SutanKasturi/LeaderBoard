//
//  ViewController.m
//  LeaderBoard
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Sutan. All rights reserved.
//

#import "ViewController.h"
#import "RankingViewController.h"
#import "CategoriesViewController.h"
#import "Constans.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) UIView *tapContainerView;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) RoundedView *roundedView;
@property (strong, nonatomic) CheckButton *btnThisWeek;
@property (strong, nonatomic) CheckButton *btnAllTime;
@property (strong, nonatomic) CheckButton *btnCategories;

@property (nonatomic, strong) UIViewController *currentViewController;

@property (nonatomic, assign) NSInteger currentType;

@property (nonatomic, strong) RankingViewController *thisWeekViewController;
@property (nonatomic, strong) RankingViewController *allTimeViewController;
@property (nonatomic, strong) CategoriesViewController *categoriesViewController;

@end

@implementation ViewController

@synthesize currentType;
@synthesize currentViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupViews];
    currentType = LEADERBOARD_THIS_WEEK;
    
    [self setButton:(int)currentType];
    
    UIFont *font = [UIFont fontWithName:@"JosefinSans" size:24.0f];
    NSString *title = @"LEADERBOARD";
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:font}];
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.text = title;
    lblTitle.textColor = UIColorFromRGB(0x1a1a1a);
    lblTitle.font = font;
    self.navigationItem.titleView = lblTitle;
    
    currentViewController = [self getViewController:currentType];
    currentViewController.view.frame = self.contentView.bounds;
    
    [self addChildViewController:currentViewController];
    [self.contentView addSubview:currentViewController.view];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *menuButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(onToggleMenu)];
    self.navigationItem.leftBarButtonItem = menuButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
}

- (void) onToggleMenu
{
    
}

#pragma mark - Setup View

- (void) setupViews
{
    [self setupTopView];
}

- (void) setupTopView
{
    self.topView = [UIView new];
    self.topView.translatesAutoresizingMaskIntoConstraints = NO;
    self.topView.backgroundColor = [UIColor clearColor];
    
    self.tapContainerView = [UIView new];
    self.tapContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tapContainerView.backgroundColor = [UIColor clearColor];
    
    self.contentView = [UIView new];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.topView addSubview:self.tapContainerView];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.contentView];

    
    // 1. Create a dictionary of views
    NSDictionary *viewsDictionary = @{@"navigationView":self.topLayoutGuide,
                                      @"topView": self.topView,
                                      @"tapContainerView": self.tapContainerView,
                                      @"contentView":self.contentView};
    NSDictionary *metrics = @{@"topViewHeight": @60,
                              @"tapContainerViewWidth": @304,
                              @"tapContainerViewHeight": @40,
                              @"contentViewTopPadding":@60,
                              @"contentViewHPadding":@20
                              };
    
    // 2. Define the view Position and automatically the Size
    NSArray *topview_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topView(topViewHeight)]"
                                                                        options:0
                                                                        metrics:metrics
                                                                          views:viewsDictionary];
    
    [self.topView addConstraints:topview_constraint_H];
    
    NSArray *tapContainerView_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[tapContainerView(tapContainerViewHeight)]"
                                                                                options:0
                                                                                metrics:metrics
                                                                                  views:viewsDictionary];
    
    NSArray *tapContainerView_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[tapContainerView(tapContainerViewWidth)]"
                                                                                options:0
                                                                                metrics:metrics
                                                                                  views:viewsDictionary];
    [self.tapContainerView addConstraints:tapContainerView_constraint_H];
    [self.tapContainerView addConstraints:tapContainerView_constraint_V];
    
    // 3. Define the views Positions
    
    NSArray *topview_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[navigationView]-0-[topView]"
                                                                                options:0
                                                                                metrics:nil
                                                                                  views:viewsDictionary];
    
    NSArray *topview_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[topView]-0-|"
                                                                                options:0
                                                                                metrics:nil
                                                                                  views:viewsDictionary];
    
    [self.view addConstraints:topview_constraint_POS_V];
    [self.view addConstraints:topview_constraint_POS_H];
    
    NSArray *contentview_constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[navigationView]-contentViewTopPadding-[contentView]-0-|"
                                                                                    options:0
                                                                                    metrics:metrics
                                                                                      views:viewsDictionary];
    
    NSArray *contentview_constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-contentViewHPadding-[contentView]-contentViewHPadding-|"
                                                                                    options:0
                                                                                    metrics:metrics
                                                                                      views:viewsDictionary];
    [self.view addConstraints:contentview_constraint_POS_V];
    [self.view addConstraints:contentview_constraint_POS_H];
    
    // 4. Define position thanks to relations with another view
    [self.topView addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.tapContainerView
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.topView
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0.0]];
    
    [self.topView addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.tapContainerView
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.topView
                              attribute:NSLayoutAttributeCenterY
                              multiplier:1.0
                              constant:0.0]];

    [self setupCheckButtons];
    self.roundedView = [[RoundedView alloc] initWithFrame:CGRectMake(0, 0, 304, 40)];
    self.roundedView.backgroundColor = CHECKED_BUTTON_COLOR;
    
    [self.roundedView addSubview:self.btnThisWeek];
    [self.roundedView addSubview:self.btnAllTime];
    [self.roundedView addSubview:self.btnCategories];
    
    [self.tapContainerView addSubview:self.roundedView];
}

- (void) setupCheckButtons
{
    self.btnThisWeek = [self newCheckButton];
    [self.btnThisWeek setTitle:kLeaderboardThisWeek forState:UIControlStateNormal];
    self.btnThisWeek.frame = CGRectMake(1, 1, CHECK_BUTTON_WIDTH, CHECK_BUTTON_HEIGHT);
    [self.btnThisWeek addTarget:self action:@selector(onThisWeek:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnThisWeek setCornerType:LEFT_CORNER];
    
    self.btnAllTime = [self newCheckButton];
    [self.btnAllTime setTitle:kLeaderboardAllTime forState:UIControlStateNormal];
    self.btnAllTime.frame = CGRectMake(2 + CHECK_BUTTON_WIDTH, 1, CHECK_BUTTON_WIDTH, CHECK_BUTTON_HEIGHT);
    [self.btnAllTime addTarget:self action:@selector(onAllTime:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnCategories = [self newCheckButton];
    [self.btnCategories setTitle:kLeaderboardCategories forState:UIControlStateNormal];
    self.btnCategories.frame = CGRectMake(3 + CHECK_BUTTON_WIDTH * 2, 1, CHECK_BUTTON_WIDTH, CHECK_BUTTON_HEIGHT);
    [self.btnCategories addTarget:self action:@selector(onCategories:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnCategories setCornerType:RIGHT_CORNER];
}

- (CheckButton*) newCheckButton
{
    CheckButton *checkButton = [CheckButton new];
    checkButton.backgroundColor = CHECKED_BUTTON_COLOR;
//    checkButton.titleLabel.textColor = CHECK_BUTTON_TEXT_COLOR;
    checkButton.titleLabel.font = [UIFont fontWithName:JosefinSansSemiBold size:CHECK_BUTTON_FONT_SIZE];
    return checkButton;
}

#pragma mark - Button Actions
- (IBAction)onThisWeek:(id)sender {
    [self setButton:LEADERBOARD_THIS_WEEK];
    [self changeViewController:LEADERBOARD_THIS_WEEK];
}
- (IBAction)onAllTime:(id)sender {
    [self setButton:LEADERBOARD_ALL_TIME];
    [self changeViewController:LEADERBOARD_ALL_TIME];
}
- (IBAction)onCategories:(id)sender {
    [self setButton:LEADERBOARD_CATEGORIES];
    [self changeViewController:LEADERBOARD_CATEGORIES];
}

- (void) setButton:(int)type
{
    [self.btnThisWeek setState:NO];
    [self.btnAllTime setState:NO];
    [self.btnCategories setState:NO];
    
    switch (type) {
        case LEADERBOARD_THIS_WEEK:
        [self.btnThisWeek setState:YES];
        break;
        case LEADERBOARD_ALL_TIME:
        [self.btnAllTime setState:YES];
        break;
        default:
        [self.btnCategories setState:YES];
        break;
    }
}

#pragma mark - UIViewController Navigations

- (UIViewController*)getViewController:(NSInteger)action {
    if ( action == LEADERBOARD_THIS_WEEK ) {
        if ( _thisWeekViewController == nil ) {
            _thisWeekViewController = [[RankingViewController alloc] init];//[self.storyboard instantiateViewControllerWithIdentifier:@"RankingViewController"];
            [_thisWeekViewController setRankingType:action];
        }
        return _thisWeekViewController;
    }
    else if ( action == LEADERBOARD_ALL_TIME ) {
        if ( _allTimeViewController == nil ) {
            _allTimeViewController = [[RankingViewController alloc] init];//[self.storyboard instantiateViewControllerWithIdentifier:@"RankingViewController"];
            [_allTimeViewController setRankingType:action];
        }
        return _allTimeViewController;
    }
    else {
        if ( _categoriesViewController == nil ) {
            _categoriesViewController = [[CategoriesViewController alloc] init];//[self.storyboard instantiateViewControllerWithIdentifier:@"CategoriesViewController"];
        }
        return _categoriesViewController;
    }
}

-(void)changeViewController:(NSInteger)action {
    if ( action == currentType )
        return;
    
    if ( action < currentType )
        [self popViewControllers:[self getViewController:action]];
    else
        [self pushViewControllers:[self getViewController:action]];
    currentType = action;
}

-(void)pushViewControllers:(UIViewController *)aNewViewController{
    
    [aNewViewController.view layoutIfNeeded];
    
    CGRect inputViewFrame=self.contentView.bounds;
    CGFloat inputViewWidth=inputViewFrame.size.width;
    
    CGRect newFrame=CGRectMake(inputViewWidth, 0, inputViewFrame.size.width, inputViewFrame.size.height);
    
    aNewViewController.view.frame=newFrame;
    
    [self.currentViewController willMoveToParentViewController:nil];
    [self addChildViewController:aNewViewController];
    [self.contentView addSubview:aNewViewController.view];
    
    [self.currentViewController willMoveToParentViewController:nil];
    
    CGRect offSetRect=CGRectOffset(newFrame, -inputViewWidth, 0.0f);
    CGRect otherOffsetRect=CGRectOffset(self.currentViewController.view.frame, -inputViewWidth, 0.0f);
    
    __weak __block ViewController *weakSelf=self;
    [UIView animateWithDuration:0.3f animations:^{
        aNewViewController.view.frame=offSetRect;
        weakSelf.currentViewController.view.frame=otherOffsetRect;
    }
                     completion:^(BOOL finished){
                         
                         [weakSelf.currentViewController.view removeFromSuperview];
                         [weakSelf.currentViewController removeFromParentViewController];
                         [aNewViewController didMoveToParentViewController:weakSelf];
                         
                         weakSelf.currentViewController = aNewViewController;
                     }];
    
}

-(void)popViewControllers:(UIViewController *)aNewViewController{
    [aNewViewController.view layoutIfNeeded];
    
    CGRect inputViewFrame=self.contentView.bounds;
    CGFloat inputViewWidth=inputViewFrame.size.width;
    
    CGRect newFrame=CGRectMake(-inputViewWidth, 0, inputViewFrame.size.width, inputViewFrame.size.height);
    
    aNewViewController.view.frame=newFrame;
    
    [self.currentViewController willMoveToParentViewController:nil];
    [self addChildViewController:aNewViewController];
    [self.contentView addSubview:aNewViewController.view];
    
    [self.currentViewController willMoveToParentViewController:nil];
    
    CGRect offSetRect=CGRectOffset(newFrame, inputViewWidth, 0.0f);
    CGRect otherOffsetRect=CGRectOffset(self.currentViewController.view.frame, inputViewWidth, 0.0f);
    
    __weak __block ViewController *weakSelf=self;
    [UIView animateWithDuration:0.3f animations:^{
        aNewViewController.view.frame=offSetRect;
        weakSelf.currentViewController.view.frame=otherOffsetRect;
    }
                     completion:^(BOOL finished){
                         
                         [weakSelf.currentViewController.view removeFromSuperview];
                         [weakSelf.currentViewController removeFromParentViewController];
                         [aNewViewController didMoveToParentViewController:weakSelf];
                         
                         weakSelf.currentViewController = aNewViewController;
                     }];
    
}


@end
