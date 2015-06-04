//
//  FriendsTableViewController.m
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/4/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "FriendsTableViewController.h"
#import "PeopleTableViewController.h"

@interface FriendsTableViewController ()

@end

@implementation FriendsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    }


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

-(IBAction)unwindTo:(UIStoryboardSegue *)segue{

    PeopleTableViewController *dVC = segue.sourceViewController;

}


@end
