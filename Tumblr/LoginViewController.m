//
//  LoginViewController.m
//  Tumblr
//
//  Created by Jairo Avalos on 7/7/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIView *loginForm;
- (IBAction)cancelButtonPressed:(id)sender;

@end

@implementation LoginViewController

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
  
  self.emailTextField.backgroundColor = [UIColor whiteColor];
  self.passwordTextField.backgroundColor = [UIColor whiteColor];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_full"]];
  self.loginForm.center = CGPointMake(self.loginForm.center.x, 300);
  self.loginForm.layer.cornerRadius = 5;
  
  [UIView animateWithDuration:1.2 delay:0 usingSpringWithDamping:20.0 initialSpringVelocity:15.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
    self.loginForm.center = CGPointMake(self.view.center.x, 180);
  } completion:nil];
  
  [self.emailTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonPressed:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}
@end
