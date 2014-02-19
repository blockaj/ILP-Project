//
//  MCLoginView.h
//  Message_Client
//
//  Created by Aaron Block on 2/19/14.
//  Copyright (c) 2014 Aaron Block. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCLoginView : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) UILabel *appTitle;
@property (strong, nonatomic) UITextField *usernameField;
@property (strong, nonatomic) UITextField *passwordField;
@end
