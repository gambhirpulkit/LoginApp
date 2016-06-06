//
//  SignupController.h
//  Skarma
//
//  Created by Pulkit Gambhir on 6/4/16.
//  Copyright © 2016 Pulkit Gambhir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *signupName;
@property (weak, nonatomic) IBOutlet UITextField *signupEmail;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *signupPwd;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;


@end
