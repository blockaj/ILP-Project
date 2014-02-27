//
//  MCLoginView.m
//  Message_Client
//
//  Created by Aaron Block on 2/19/14.
//  Copyright (c) 2014 Aaron Block. All rights reserved.
//

#import "MCLoginView.h"
#import "MCRegisterView.h"
#import "MCMessageListView.h"

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
    self.usernameField.autocapitalizationType = NO;
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
    loginButton.font = fontForField;
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Register" style:UIBarButtonItemStyleBordered target:self action:@selector(switchToRegister)];
    

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)login {
    NSString *post = [NSString stringWithFormat:@"username=%@&password=%@", self.usernameField.text, self.passwordField.text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://localhost:3000/login"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    NSHTTPURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    if (response.statusCode == 200) {
        NSLog(@"100 percent Success");
        MCMessageListView *messageList = [[MCMessageListView alloc] init];
        messageList.userName = self.usernameField.text;
        [self.navigationController pushViewController:messageList animated:NO];
        
    } else {
        NSLog(@"WTF?");
    }
}
-(void)switchToRegister {
    MCRegisterView *registerView = [[MCRegisterView alloc] init];
    [self.navigationController pushViewController:registerView animated:NO];
}
@end
