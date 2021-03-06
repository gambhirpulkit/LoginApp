//
//  ResetPasswordController.m
//  Skarma
//
//  Created by Pulkit Gambhir on 6/4/16.
//  Copyright © 2016 Pulkit Gambhir. All rights reserved.
//

#import "ResetPasswordController.h"

@implementation ResetPasswordController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 0.5;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, _resetEmail.frame.size.height - borderWidth, _resetEmail.frame.size.width, _resetEmail.frame.size.height);
    border.borderWidth = borderWidth;
    [_resetEmail.layer addSublayer:border];
    _resetEmail.layer.masksToBounds = YES;
    
    
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    

    
}



-(void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
//    self.view.alpha = 0.7f;
    
    self.navigationItem.title = @"Forgot Password";
    
    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    //    backgroundImageView.alpha = 1.8f;
    UIView *blackOverlay = [[UIView alloc] initWithFrame: backgroundImageView.frame];
    blackOverlay.layer.backgroundColor = [[UIColor blackColor] CGColor];
    blackOverlay.layer.opacity = 0.5f;
    [self.view insertSubview:blackOverlay atIndex:0];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    

    
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithTitle:@"Back" style: UIBarButtonItemStyleBordered target:self action:nil];
    self.navigationController.navigationBar.topItem.backBarButtonItem=btnBack;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    
    [_resetEmail setLeftViewMode:UITextFieldViewModeAlways];
    _resetEmail.leftView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    
    [[_resetBtn layer] setBorderWidth:1.0f];
    _resetBtn.layer.cornerRadius = 5;
    _resetBtn.clipsToBounds = YES;
    [[_resetBtn layer] setBorderColor:[UIColor whiteColor].CGColor];

    _resetEmail.delegate = self;
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
