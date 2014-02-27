//
//  MCRegisterView.m
//  Message_Client
//
//  Created by Aaron Block on 2/21/14.
//  Copyright (c) 2014 Aaron Block. All rights reserved.
//

#import "MCRegisterView.h"

@implementation MCRegisterView
-(void)viewDidLoad {
    [super viewDidLoad];
    self.pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, 75, 290, 30)];
    UIFont *font = [UIFont fontWithName:@"AvenirNext-Heavy" size:24];
    self.pageTitle.font = font;
    self.pageTitle.textAlignment = NSTextAlignmentCenter;
    self.pageTitle.text = @"Register";
    [self.view addSubview: self.pageTitle];
    self.navigationItem.hidesBackButton = YES;
    
    self.usernameField = [[UITextField alloc] initWithFrame:CGRectMake(65, 125, 190, 30)];
    self.usernameField.placeholder = @"username";
    UIFont *placeholderFont = [UIFont fontWithName:@"Avenir-Book" size:20];
    self.usernameField.font = placeholderFont;
    self.usernameField.returnKeyType = UIReturnKeyDone;
    self.usernameField.delegate = self;
    self.usernameField.autocapitalizationType = NO;
    [self.view addSubview:self.usernameField];
    
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(65, 175, 190, 30)];
    self.passwordField.placeholder = @"password";
    self.passwordField.font = placeholderFont;
    self.passwordField.returnKeyType = UIReturnKeyDone;
    self.passwordField.delegate = self;
    self.passwordField.secureTextEntry = YES;
    [self.view addSubview:self.passwordField];
    
    self.confirmPasswordField = [[UITextField alloc] initWithFrame:CGRectMake(65, 225, 190, 30)];
    self.confirmPasswordField.placeholder = @"confirm password";
    self.confirmPasswordField.font = placeholderFont;
    self.confirmPasswordField.returnKeyType = UIReturnKeyDone;
    self.confirmPasswordField.delegate = self;
    self.confirmPasswordField.secureTextEntry = YES;
    [self.view addSubview:self.confirmPasswordField];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registerButton.frame = CGRectMake(110, 300, 100, 30);
    [registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerAccount) forControlEvents:UIControlEventTouchUpInside];
    registerButton.font = placeholderFont;
    [self.view addSubview:registerButton];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)registerAccount {
    NSString *post = [NSString stringWithFormat:@"username=%@&password=%@", self.usernameField.text, self.passwordField.text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", postData.length];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://localhost:3000/register"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSHTTPURLResponse *serverResponse;
    [self.navigationController popToRootViewControllerAnimated:NO];
    NSLog(@"Response: %@", responseData);
   }
@end
