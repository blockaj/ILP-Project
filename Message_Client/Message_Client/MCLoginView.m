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
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.frame = CGRectMake(110, 250, 100, 30);
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)login {
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSArray *postData = [NSArray arrayWithObjects:self.usernameField.text, self.passwordField.text, nil];
    NSData *bodyData = [NSKeyedArchiver archivedDataWithRootObject:postData];
    [request setHTTPBody:bodyData];
}
@end
