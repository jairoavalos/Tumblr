//
//  HomeViewController.m
//  Tumblr
//
//  Created by Jairo Avalos on 7/6/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *homeScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *homeView;

- (IBAction)loginPressed:(id)sender;
@end

@implementation HomeViewController

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
  
  self.homeScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.homeView.frame.size.height + 1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginPressed:(id)sender {
  LoginViewController *loginVC = [[LoginViewController alloc] init];
  [self presentViewController:loginVC animated:NO completion:nil];
  //[self.view addSubview:loginVC.view];
}
@end
