//
//  LoginController.h
//  Skarma
//
//  Created by Pulkit Gambhir on 6/4/16.
//  Copyright © 2016 Pulkit Gambhir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <FacebookSDK/FacebookSDK.h>

@interface LoginController : UIViewController <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginEmail;

@property (weak, nonatomic) IBOutlet UITextField *loginPwd;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgotBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (weak, nonatomic) IBOutlet FBLoginView *fbLogin;

@end
