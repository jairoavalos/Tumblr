//
//  AccountViewController.m
//  Tumblr
//
//  Created by Jairo Avalos on 7/6/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *accountScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *accountView;

@end

@implementation AccountViewController

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
  
  self.accountScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.accountView.frame.size.height + 1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
