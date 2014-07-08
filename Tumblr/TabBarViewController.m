//
//  TabBarViewController.m
//  Tumblr
//
//  Created by Jairo Avalos on 7/6/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "AccountViewController.h"
#import "TrendingViewController.h"
#import "ComposeViewController.h"

@interface TabBarViewController ()

// Properties
@property (nonatomic, strong) HomeViewController *homeViewController;
@property (nonatomic, strong) SearchViewController *searchViewController;
@property (nonatomic, strong) AccountViewController *accountViewController;
@property (nonatomic, strong) TrendingViewController *trendingViewController;
@property float originalTooltipYPosition;

// Outlets
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIButton *homeTabBarButton;
@property (strong, nonatomic) IBOutlet UIButton *searchTabBarButton;
@property (strong, nonatomic) IBOutlet UIButton *accountTabBarButton;
@property (strong, nonatomic) IBOutlet UIButton *trendingTabBarButton;
@property (strong, nonatomic) IBOutlet UIView *statusBarBackground;
@property (strong, nonatomic) IBOutlet UIImageView *explorePopover;


// Actions
- (IBAction)homePressed:(id)sender;
- (IBAction)searchPressed:(id)sender;
- (IBAction)composePressed:(id)sender;
- (IBAction)accountPressed:(id)sender;
- (IBAction)trendingPressed:(id)sender;

@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.homeViewController = [[HomeViewController alloc] init];
        self.searchViewController = [[SearchViewController alloc] init];
        self.accountViewController = [[AccountViewController alloc] init];
        self.trendingViewController = [[TrendingViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    // Set up the homeview as the default
    // set home button to be selected by default
    [self.homeTabBarButton setImage:[UIImage imageNamed:@"home_selected_icon"] forState:UIControlStateNormal];
    self.statusBarBackground.hidden = YES;
    [self.contentView addSubview:self.homeViewController.view];
  
    // Begin tooltip animation
    self.originalTooltipYPosition= self.explorePopover.center.y;
    [self animateTooltip];

  
}

- (void)animateTooltip {
  [UIView animateWithDuration:0.8 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    self.explorePopover.center = CGPointMake(self.explorePopover.center.x, self.explorePopover.center.y + 5);
  } completion:^(BOOL finished) {
    [UIView animateWithDuration:0.8 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
      self.explorePopover.center = CGPointMake(self.explorePopover.center.x, self.originalTooltipYPosition);
    } completion:^(BOOL finished) {
      [self animateTooltip];
    }];
  }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)homePressed:(id)sender {
  [self setTabBarSelectedState:@"home"];
  //self.homeViewController.view.frame = self.contentView.frame;
  [self.contentView addSubview:self.homeViewController.view];
}

- (IBAction)searchPressed:(id)sender {
  [self setTabBarSelectedState:@"search"];
  //self.searchViewController.view.frame = self.contentView.frame;
  [self.contentView addSubview:self.searchViewController.view];
}

- (IBAction)composePressed:(id)sender {
  ComposeViewController *composeVC = [[ComposeViewController alloc] init];
  [self presentViewController:composeVC animated:NO completion:nil];
}

- (IBAction)accountPressed:(id)sender {
  [self setTabBarSelectedState:@"account"];
  //self.accountViewController.view.frame = self.contentView.frame;
  [self.contentView addSubview:self.accountViewController.view];
}

- (IBAction)trendingPressed:(id)sender {
  [self setTabBarSelectedState:@"trending"];
  //self.trendingViewController.view.frame = self.contentView.frame;
  [self.contentView addSubview:self.trendingViewController.view];
}

// Method to adjust tab bar buttons to reflect highlighted state
- (void)setTabBarSelectedState:(NSString *)selectedTab {
  if ([selectedTab isEqualToString:@"home"]) {
    
    [self.homeTabBarButton setImage:[UIImage imageNamed:@"home_selected_icon"] forState:UIControlStateNormal];
    [self.searchTabBarButton setImage:[UIImage imageNamed:@"search_icon"] forState:UIControlStateNormal];
    [self.accountTabBarButton setImage:[UIImage imageNamed:@"account_icon"] forState:UIControlStateNormal];
    [self.trendingTabBarButton setImage:[UIImage imageNamed:@"trending_icon"] forState:UIControlStateNormal];
    // Hide status bar background
    self.statusBarBackground.hidden = YES;
    
    // Show tooltip if on search tab
    [UIView  animateWithDuration:0.3 animations:^{
      self.explorePopover.alpha = 1;
    }];
    
  } else if ([selectedTab isEqualToString:@"search"]) {
    
    [self.searchTabBarButton setImage:[UIImage imageNamed:@"search_selected_icon"] forState:UIControlStateNormal];
    [self.homeTabBarButton setImage:[UIImage imageNamed:@"home_icon"] forState:UIControlStateNormal];
    [self.accountTabBarButton setImage:[UIImage imageNamed:@"account_icon"] forState:UIControlStateNormal];
    [self.trendingTabBarButton setImage:[UIImage imageNamed:@"trending_icon"] forState:UIControlStateNormal];
    // Show status bar background
    self.statusBarBackground.hidden = NO;
    
    // Hide tooltip if on search tab
    [UIView  animateWithDuration:0.5 animations:^{
      [UIView animateWithDuration:0.1 animations:^{
        self.explorePopover.center = CGPointMake(self.explorePopover.center.x, self.explorePopover.center.y + 10);
      }];
      self.explorePopover.alpha = 0;
    }];
    
  } else if ([selectedTab isEqualToString:@"account"]) {
    
    [self.accountTabBarButton setImage:[UIImage imageNamed:@"account_selected_icon"] forState:UIControlStateNormal];
    [self.homeTabBarButton setImage:[UIImage imageNamed:@"home_icon"] forState:UIControlStateNormal];
    [self.searchTabBarButton setImage:[UIImage imageNamed:@"search_icon"] forState:UIControlStateNormal];
    [self.trendingTabBarButton setImage:[UIImage imageNamed:@"trending_icon"] forState:UIControlStateNormal];
    // Show status bar background
    self.statusBarBackground.hidden = NO;
    
    // Show tooltip if on search tab
    [UIView  animateWithDuration:0.3 animations:^{
      self.explorePopover.alpha = 1;
    }];
    
  } else {
    
    [self.trendingTabBarButton setImage:[UIImage imageNamed:@"trending_selected_icon"] forState:UIControlStateNormal];
    [self.homeTabBarButton setImage:[UIImage imageNamed:@"home_icon"] forState:UIControlStateNormal];
    [self.searchTabBarButton setImage:[UIImage imageNamed:@"search_icon"] forState:UIControlStateNormal];
    [self.accountTabBarButton setImage:[UIImage imageNamed:@"account_icon"] forState:UIControlStateNormal];
    // Show status bar background
    self.statusBarBackground.hidden = NO;
    
    // Show tooltip if on search tab
    [UIView  animateWithDuration:0.3 animations:^{
      self.explorePopover.alpha = 1;
    }];
    
  }
}

@end
