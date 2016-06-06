//
//  SignupController.m
//  Skarma
//
//  Created by Pulkit Gambhir on 6/4/16.
//  Copyright © 2016 Pulkit Gambhir. All rights reserved.
//

#import "SignupController.h"

@implementation SignupController

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    

    
//    [self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 0.5;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, _signupName.frame.size.height - borderWidth, _signupName.frame.size.width, _signupName.frame.size.height);
    border.borderWidth = borderWidth;
    [_signupName.layer addSublayer:border];
    _signupName.layer.masksToBounds = YES;
    
    CALayer *borderName = [CALayer layer];
    borderName.borderColor = [UIColor whiteColor].CGColor;
    borderName.frame = CGRectMake(0, _signupEmail.frame.size.height - borderWidth, _signupEmail.frame.size.width, _signupEmail.frame.size.height);
    borderName.borderWidth = borderWidth;
    [_signupEmail.layer addSublayer:borderName];
    _signupEmail.layer.masksToBounds = YES;
    
    CALayer *borderPwd = [CALayer layer];
    borderPwd.borderColor = [UIColor whiteColor].CGColor;
    borderPwd.frame = CGRectMake(0, _signupPwd.frame.size.height - borderWidth, _signupPwd.frame.size.width, _signupPwd.frame.size.height);
    borderPwd.borderWidth = borderWidth;
    [_signupPwd.layer addSublayer:borderPwd];
    _signupPwd.layer.masksToBounds = YES;
    
    CALayer *borderPhn = [CALayer layer];
    borderPhn.borderColor = [UIColor whiteColor].CGColor;
    borderPhn.frame = CGRectMake(0, _phone.frame.size.height - borderWidth, _phone.frame.size.width, _phone.frame.size.height);
    borderPhn.borderWidth = borderWidth;
    [_phone.layer addSublayer:borderPhn];
    _phone.layer.masksToBounds = YES;
    
    


}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"Register";
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithTitle:@"Back" style: UIBarButtonItemStyleBordered target:self action:nil];
    self.navigationController.navigationBar.topItem.backBarButtonItem=btnBack;
    
    UIColor *color = [UIColor lightTextColor];
    _signupName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Name" attributes:@{NSForegroundColorAttributeName: color}];
    _signupEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: color}];
    _signupPwd.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
    _phone.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Phone" attributes:@{NSForegroundColorAttributeName: color}];

    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    //    backgroundImageView.alpha = 1.8f;
    UIView *blackOverlay = [[UIView alloc] initWithFrame: backgroundImageView.frame];
    blackOverlay.layer.backgroundColor = [[UIColor blackColor] CGColor];
    blackOverlay.layer.opacity = 0.5f;
    [self.view insertSubview:blackOverlay atIndex:0];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    

    [[_registerBtn layer] setBorderWidth:1.0f];
    _registerBtn.layer.cornerRadius = 5;
    _registerBtn.clipsToBounds = YES;
    [[_registerBtn layer] setBorderColor:[UIColor whiteColor].CGColor];

    
    _signupPwd.secureTextEntry = YES;
    [_signupPwd setRightViewMode:UITextFieldViewModeAlways];
    _signupPwd.rightView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Invisible.png"]];
    
    _signupName.delegate = self;
    _signupEmail.delegate = self;
    _signupPwd.delegate = self;
    _phone.delegate = self;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

// It is important for you to hide the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
