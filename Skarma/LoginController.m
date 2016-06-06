//
//  LoginController.m
//  Skarma
//
//  Created by Pulkit Gambhir on 6/4/16.
//  Copyright © 2016 Pulkit Gambhir. All rights reserved.
//

#import "LoginController.h"


@implementation LoginController

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    
    NSLog(@"sub");
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 0.5;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, _loginEmail.frame.size.height - borderWidth, _loginEmail.frame.size.width, _loginEmail.frame.size.height);
    border.borderWidth = borderWidth;
    [_loginEmail.layer addSublayer:border];
    _loginEmail.layer.masksToBounds = YES;
    
    CALayer *borderPwd = [CALayer layer];
    CGFloat borderPwdWidth = 0.5;
    borderPwd.borderColor = [UIColor whiteColor].CGColor;
    borderPwd.frame = CGRectMake(0, _loginPwd.frame.size.height - borderPwdWidth, _loginPwd.frame.size.width, _loginPwd.frame.size.height);
    borderPwd.borderWidth = borderPwdWidth;
    [_loginPwd.layer addSublayer:borderPwd];
    _loginPwd.layer.masksToBounds = YES;
    
    [_loginEmail setLeftViewMode:UITextFieldViewModeAlways];
    _loginEmail.leftView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    
    [_loginPwd setLeftViewMode:UITextFieldViewModeAlways];
    _loginPwd.leftView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lock.png"]];
    NSLog(@"appear");
}



-(void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Login VC");
    
    self.fbLogin.delegate = self;
    self.fbLogin.readPermissions = @[@"public_profile", @"email"];
    
    _loginPwd.secureTextEntry = YES;
    
    self.navigationItem.title = @"Login";
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
//    backgroundImageView.alpha = 1.8f;
    UIView *blackOverlay = [[UIView alloc] initWithFrame: backgroundImageView.frame];
    blackOverlay.layer.backgroundColor = [[UIColor blackColor] CGColor];
    blackOverlay.layer.opacity = 0.5f;
    [self.view insertSubview:blackOverlay atIndex:0];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
//    self.view.alpha = 0.0f;
    
    [_forgotBtn addTarget:self action:@selector(forgotAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];

    
    
    [[_loginBtn layer] setBorderWidth:1.0f];
    _loginBtn.layer.cornerRadius = 5;
    _loginBtn.clipsToBounds = YES;
    [[_loginBtn layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    [[_registerBtn layer] setBorderWidth:1.0f];
    _registerBtn.layer.cornerRadius = 5;
    _registerBtn.clipsToBounds = YES;
    [[_registerBtn layer] setBorderColor:[UIColor whiteColor].CGColor];

}

-(void)loginAction:(UIButton*)sender {

    if ((_loginEmail.text.length > 0) || (_loginPwd.text.length > 0)) {
        
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"ISLOGGEDIN"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        
        [self performSegueWithIdentifier: @"goto_home" sender: self];
        
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Credentials"
                                                        message:@"Please enter valid email and password."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }

    
}



-(void)forgotAction:(UIButton*)sender {
    NSLog(@"forgot");
    
//    [self performSegueWithIdentifier:@"goto_reset" sender:sender];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"goto_reset"])
//    {
//        NSLog(@"go reset");
//    }
//}

#pragma mark - FBLoginView Delegate method implementation

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"ISLOGGEDIN"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    
    [self performSegueWithIdentifier: @"goto_home" sender: self];
}


-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}

@end
