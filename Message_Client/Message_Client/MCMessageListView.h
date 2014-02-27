//
//  MCMessageListView.h
//  Message_Client
//
//  Created by Aaron Block on 2/26/14.
//  Copyright (c) 2014 Aaron Block. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCMessageListView : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *messageList;
@property (nonatomic, strong) NSString *userName;
-(void)newMessage;
@end
