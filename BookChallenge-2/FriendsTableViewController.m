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
#import "FriendViewController.h"

@interface FriendsTableViewController ()
@property NSManagedObjectContext *moc;
@property (nonatomic)NSArray *allPeoples;
@property NSMutableArray *friends;
@end

@implementation FriendsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.moc = appDelegate.managedObjectContext;

    [self load];
}

-(void)load{
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Friend"];
    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    request.sortDescriptors = @[sortDescriptor1];
    self.allPeoples = [self.moc executeFetchRequest:request error:nil];
    self.friends = [NSMutableArray new];
    for (Friend *friend in self.allPeoples) {
        if ([friend.isFriend isEqual:@1]) {
            [self.friends addObject:friend];
        }
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    Friend *friend =self.friends[indexPath.row];

    cell.textLabel.text =friend.name;
    return cell;
}

-(IBAction)unwindTo:(UIStoryboardSegue *)segue{
    [self load];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier  isEqual: @"friend"]) {
        FriendViewController *dvc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Friend *friend =self.friends[indexPath.row];

        //    cell.textLabel.text =friend.name;
        dvc.frienddd = friend;
    }

}



@end
