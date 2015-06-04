//
//  PeopleTableViewController.m
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/4/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "PeopleTableViewController.h"

@interface PeopleTableViewController ()
@property (nonatomic) NSArray *peoples;
@end

@implementation PeopleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/18/friends.json"]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.peoples = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        [self.tableView reloadData];
    }];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.peoples.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID2" forIndexPath:indexPath];
    
    cell.textLabel.text = self.peoples[indexPath.row];
    return cell;
}



@end
