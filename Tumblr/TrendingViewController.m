//
//  TrendingViewController.m
//  Tumblr
//
//  Created by Jairo Avalos on 7/6/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "TrendingViewController.h"

@interface TrendingViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *trendingScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *trendingView;

@end

@implementation TrendingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
  self.trendingScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.trendingView.frame.size.height + 60);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
