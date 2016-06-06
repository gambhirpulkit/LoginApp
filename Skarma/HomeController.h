//
//  HomeController.h
//  Skarma
//
//  Created by Pulkit Gambhir on 6/4/16.
//  Copyright © 2016 Pulkit Gambhir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface HomeController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *logoutBtn;
@property (weak, nonatomic) IBOutlet UIImageView *userImg;

@property (weak, nonatomic) IBOutlet UITextField *editName;
@property (weak, nonatomic) IBOutlet UITextField *editEmail;
@property (weak, nonatomic) IBOutlet UITextField *editPhone;

@end
