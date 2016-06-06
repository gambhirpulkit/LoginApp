//
//  LoginNavController.m
//  Skarma
//
//  Created by Pulkit Gambhir on 6/4/16.
//  Copyright © 2016 Pulkit Gambhir. All rights reserved.
//

#import "LoginNavController.h"

@implementation LoginNavController

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Login Nav VC");
    
    [self.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;
}

@end
