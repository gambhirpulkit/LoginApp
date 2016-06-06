//
//  ResetPasswordController.h
//  Skarma
//
//  Created by Pulkit Gambhir on 6/4/16.
//  Copyright © 2016 Pulkit Gambhir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPasswordController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *resetEmail;
@property (weak, nonatomic) IBOutlet UIButton *resetBtn;

@end
