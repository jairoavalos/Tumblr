//
//  ComposeViewController.m
//  Tumblr
//
//  Created by Jairo Avalos on 7/8/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()
@property (strong, nonatomic) IBOutlet UIView *textButton;
@property (strong, nonatomic) IBOutlet UIView *photoButton;
@property (strong, nonatomic) IBOutlet UIView *quoteButton;
@property (strong, nonatomic) IBOutlet UIView *linkButton;
@property (strong, nonatomic) IBOutlet UIView *chatButton;
@property (strong, nonatomic) IBOutlet UIView *videoButton;
@property (strong, nonatomic) IBOutlet UIButton *nevermindButton;

- (IBAction)nevermindPressed:(id)sender;

@end

@implementation ComposeViewController

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
  
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_full"]];
  [self animateButtons];
  
}

- (void)animateButtons {
  self.nevermindButton.center = CGPointMake(self.nevermindButton.center.x, self.view.frame.size.height * 2);
  
  [UIView animateWithDuration:.4 delay:0 usingSpringWithDamping:10.0 initialSpringVelocity:25.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    self.photoButton.center = CGPointMake(self.photoButton.center.x, 210);
  } completion:nil];
  
  [UIView animateWithDuration:.4 delay:0.1 usingSpringWithDamping:10.0 initialSpringVelocity:25.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    self.textButton.center = CGPointMake(self.textButton.center.x, 210);
    self.quoteButton.center = CGPointMake(self.quoteButton.center.x, 210);
  } completion:nil];
  
  [UIView animateWithDuration:.4 delay:0.15 usingSpringWithDamping:10.0 initialSpringVelocity:25.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    self.chatButton.center = CGPointMake(self.chatButton.center.x, 335);
  } completion:nil];
  
  [UIView animateWithDuration:.4 delay:0.2 usingSpringWithDamping:10.0 initialSpringVelocity:25.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    self.linkButton.center = CGPointMake(self.linkButton.center.x, 335);
    self.videoButton.center = CGPointMake(self.videoButton.center.x, 335);
  } completion:nil];
  
  [UIView animateWithDuration:0.5 animations:^{
    self.nevermindButton.center = CGPointMake(self.nevermindButton.center.x, self.view.frame.size.height - self.nevermindButton.frame.size.height/2);
  }];
  
}

- (void)dismissButtons {
  
  [UIView animateWithDuration:.4 delay:0 usingSpringWithDamping:10.0 initialSpringVelocity:25.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    self.photoButton.center = CGPointMake(self.photoButton.center.x, -100);
  } completion:nil];
  
  [UIView animateWithDuration:.4 delay:0.1 usingSpringWithDamping:10.0 initialSpringVelocity:25.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    self.textButton.center = CGPointMake(self.textButton.center.x, -100);
    self.quoteButton.center = CGPointMake(self.quoteButton.center.x, -100);
  } completion:nil];
  
  [UIView animateWithDuration:.4 delay:0.15 usingSpringWithDamping:10.0 initialSpringVelocity:25.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    self.chatButton.center = CGPointMake(self.chatButton.center.x, -100);
  } completion:nil];
  
  [UIView animateWithDuration:.4 delay:0.2 usingSpringWithDamping:10.0 initialSpringVelocity:25.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    self.linkButton.center = CGPointMake(self.linkButton.center.x, -100);
    self.videoButton.center = CGPointMake(self.videoButton.center.x, -100);
  } completion:nil];
  
  [UIView animateWithDuration:0.5 animations:^{
    self.nevermindButton.center = CGPointMake(self.nevermindButton.center.x, self.view.frame.size.height + self.nevermindButton.frame.size.height/2);
  }];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)nevermindPressed:(id)sender {
  //[self dismissViewControllerAnimated:NO completion:nil];
  [self dismissViewControllerAnimated:NO completion:^{
    [self dismissButtons];
  }];
}
@end
