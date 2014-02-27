//
//  MCMessageListView.m
//  Message_Client
//
//  Created by Aaron Block on 2/26/14.
//  Copyright (c) 2014 Aaron Block. All rights reserved.
//

#import "MCMessageListView.h"
#import "MCLoginView.h"
#import "MCNewMessageView.h"


@implementation MCMessageListView
-(void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
    self.view = tableView;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonSystemItemAdd target:self action:@selector(newMessage)];
    
    NSURL *url = [NSURL URLWithString:@"localhost:3000/list_messages"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSHTTPURLResponse *response;
    NSError *err;
    NSData *getData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSLog(@"Response: %ld", response.statusCode);
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.userName;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *myIdentifier = @"My Reuse Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: myIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:myIdentifier];
    }
    NSString *cellText = [self.messageList objectAtIndex:indexPath.row];
    cell.textLabel.text = cellText;
    return cell;
    
    
}

-(void)newMessage {
    MCNewMessageView *newMessageView = [[MCNewMessageView alloc] init];
    [self.navigationController pushViewController:newMessageView animated:NO];
}

@end
