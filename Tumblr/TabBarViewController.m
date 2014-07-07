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

@interface TabBarViewController ()

// Properties
@property (nonatomic, strong) HomeViewController *homeViewController;
@property (nonatomic, strong) SearchViewController *searchViewController;
@property (nonatomic, strong) AccountViewController *accountViewController;
@property (nonatomic, strong) TrendingViewController *trendingViewController;

// Outlets
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIButton *homeTabBarButton;
@property (strong, nonatomic) IBOutlet UIButton *searchTabBarButton;
@property (strong, nonatomic) IBOutlet UIButton *accountTabBarButton;
@property (strong, nonatomic) IBOutlet UIButton *trendingTabBarButton;
@property (strong, nonatomic) IBOutlet UIView *statusBarBackground;


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
  } else if ([selectedTab isEqualToString:@"search"]) {
    [self.searchTabBarButton setImage:[UIImage imageNamed:@"search_selected_icon"] forState:UIControlStateNormal];
    [self.homeTabBarButton setImage:[UIImage imageNamed:@"home_icon"] forState:UIControlStateNormal];
    [self.accountTabBarButton setImage:[UIImage imageNamed:@"account_icon"] forState:UIControlStateNormal];
    [self.trendingTabBarButton setImage:[UIImage imageNamed:@"trending_icon"] forState:UIControlStateNormal];
    // Show status bar background
    self.statusBarBackground.hidden = NO;
  } else if ([selectedTab isEqualToString:@"account"]) {
    [self.accountTabBarButton setImage:[UIImage imageNamed:@"account_selected_icon"] forState:UIControlStateNormal];
    [self.homeTabBarButton setImage:[UIImage imageNamed:@"home_icon"] forState:UIControlStateNormal];
    [self.searchTabBarButton setImage:[UIImage imageNamed:@"search_icon"] forState:UIControlStateNormal];
    [self.trendingTabBarButton setImage:[UIImage imageNamed:@"trending_icon"] forState:UIControlStateNormal];
    // Show status bar background
    self.statusBarBackground.hidden = NO;
  } else {
    [self.trendingTabBarButton setImage:[UIImage imageNamed:@"trending_selected_icon"] forState:UIControlStateNormal];
    [self.homeTabBarButton setImage:[UIImage imageNamed:@"home_icon"] forState:UIControlStateNormal];
    [self.searchTabBarButton setImage:[UIImage imageNamed:@"search_icon"] forState:UIControlStateNormal];
    [self.accountTabBarButton setImage:[UIImage imageNamed:@"account_icon"] forState:UIControlStateNormal];
    // Show status bar background
    self.statusBarBackground.hidden = NO;
  }
}

@end
