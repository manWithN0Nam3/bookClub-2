//
//  FriendsTableViewController.m
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/4/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "FriendsTableViewController.h"
#import "PeopleTableViewController.h"
#import "AppDelegate.h"
#import "Friend.h"

@interface FriendsTableViewController ()
@property NSManagedObjectContext *moc;
@property (nonatomic)NSArray *friends;
@end

@implementation FriendsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.moc = appDelegate.managedObjectContext;

    [self load];
    [self.tableView reloadData];
    }


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.friends.count;
}

-(void)load{
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Friend"];
    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    request.sortDescriptors = @[sortDescriptor1];
    self.friends = [self.moc executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    Friend *friend =self.friends[indexPath.row];

    cell.textLabel.text =friend.name;
    return cell;
}

-(IBAction)unwindTo:(UIStoryboardSegue *)segue{

    PeopleTableViewController *dVC = segue.sourceViewController;


    [self load];
}


@end
