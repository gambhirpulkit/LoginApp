//
//  HomeController.m
//  Skarma
//
//  Created by Pulkit Gambhir on 6/4/16.
//  Copyright © 2016 Pulkit Gambhir. All rights reserved.
//

#import "HomeController.h"

@implementation HomeController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:true];
    NSLog(@"appear");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger isLoggedIn = [defaults integerForKey:@"ISLOGGEDIN"];
    
    NSLog(@"%ld",(long)isLoggedIn);
    
    if (isLoggedIn != 1) {
        NSLog(@"Not logged in");
        [self performSegueWithIdentifier:@"goto_login" sender:self];
    }
    else {
        NSLog(@"Logged in");
    }
    
    //int isLoggedIn = [defaults integerForKey:@"ISLOGGEDIN"];
    
    
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _editEmail.borderStyle = UITextBorderStyleNone;
    _editName.borderStyle = UITextBorderStyleNone;
    _editPhone.borderStyle = UITextBorderStyleNone;
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 0.5;
    border.borderColor = [UIColor blackColor].CGColor;
    border.frame = CGRectMake(0, _editEmail.frame.size.height - borderWidth, _editEmail.frame.size.width, _editEmail.frame.size.height);
    border.borderWidth = borderWidth;
    [_editEmail.layer addSublayer:border];
    _editEmail.layer.masksToBounds = YES;
    
    CALayer *borderName = [CALayer layer];
    borderName.borderColor = [UIColor blackColor].CGColor;
    borderName.frame = CGRectMake(0, _editName.frame.size.height - borderWidth, _editName.frame.size.width, _editName.frame.size.height);
    borderName.borderWidth = borderWidth;
    [_editName.layer addSublayer:borderName];
    _editName.layer.masksToBounds = YES;
    
    CALayer *borderPhn = [CALayer layer];
    borderPhn.borderColor = [UIColor blackColor].CGColor;
    borderPhn.frame = CGRectMake(0, _editPhone.frame.size.height - borderWidth, _editPhone.frame.size.width, _editPhone.frame.size.height);
    borderPhn.borderWidth = borderWidth;
    [_editPhone.layer addSublayer:borderPhn];
    _editPhone.layer.masksToBounds = YES;
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"hey");
    
    self.navigationItem.title = @"Edit Profile";
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor darkGrayColor]}];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIImage *image = [UIImage imageNamed:@"yourRoundImage.png"];
    self.userImg.image = [UIImage imageNamed:@"user_img"];
    self.userImg.layer.cornerRadius =self.userImg.frame.size.height/2;
    self.userImg.layer.masksToBounds = YES;
    self.userImg.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.userImg.layer.borderWidth=2;

    _editName.text = @"Pulkit Gambhir";
    _editEmail.text = @"gambhirpulkit@gmail.com";
    _editPhone.text = @"8010127137";
    
    _logoutBtn.target = self;
    _logoutBtn.action = @selector(logoutAction:);
        
}

-(void)logoutAction:(UIBarButtonItem*)sender {
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger isLoggedIn = [defaults integerForKey:@"ISLOGGEDIN"];
    
    NSLog(@"saas%ld",(long)isLoggedIn);
    
    if (FBSession.activeSession.isOpen)
    {
        [FBSession.activeSession closeAndClearTokenInformation];
    }
    
    
    [self performSegueWithIdentifier: @"goto_login" sender: self];
    
}


@end

