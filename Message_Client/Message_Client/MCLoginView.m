//
//  MCLoginView.m
//  Message_Client
//
//  Created by Aaron Block on 2/19/14.
//  Copyright (c) 2014 Aaron Block. All rights reserved.
//

#import "MCLoginView.h"

@implementation MCLoginView
-(void)viewDidLoad {
    [super viewDidLoad];
    //Setup appTitle label
    self.appTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, 75, 290, 30)];
    self.appTitle.text = @"Message Client";
    UIFont *fontForLabel = [UIFont fontWithName:@"AvenirNext-Heavy" size:24];
    self.appTitle.font = fontForLabel;
    self.appTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.appTitle];
    
    //Setup usernameField text field
    self.usernameField = [[UITextField alloc] initWithFrame:CGRectMake(65, 125, 190, 30)];
    UIFont *fontForField = [UIFont fontWithName:@"Avenir-Book" size:20];
    self.usernameField.font = fontForField;
    self.usernameField.placeholder = @"username";
    self.usernameField.delegate = self;
    self.usernameField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.usernameField];
    
    //Setup passwordField text field
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(65, 175, 190, 30)];
    self.passwordField.font = fontForField;
    self.passwordField.placeholder = @"password";
    self.passwordField.secureTextEntry = YES;
    self.passwordField.delegate = self;
    self.passwordField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.passwordField];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
