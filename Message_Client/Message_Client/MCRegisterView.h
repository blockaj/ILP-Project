//
//  MCRegisterView.h
//  Message_Client
//
//  Created by Aaron Block on 2/21/14.
//  Copyright (c) 2014 Aaron Block. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCRegisterView : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic)UILabel *pageTitle;
@property (strong, nonatomic)UITextField *usernameField;
@property (strong, nonatomic)UITextField *passwordField;
@property (strong, nonatomic)UITextField *confirmPasswordField;
-(void)registerAccount;
@end
