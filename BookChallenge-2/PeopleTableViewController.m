//
//  PeopleTableViewController.m
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/4/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "PeopleTableViewController.h"
#import "Friend.h"
#import "AppDelegate.h"

@interface PeopleTableViewController ()
@property (nonatomic) NSArray *peoples;
//@property (nonatomic) NSMutableArray *peoples2;

@property NSArray *friends;
@property NSManagedObjectContext *moc;



@end

@implementation PeopleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.moc = appDelegate.managedObjectContext;
    [self load];
    if (self.friends.count == 0) {
        [self loadJSONdata];
    }

}

-(void)loadJSONdata {
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/18/friends.json"]];
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        self.peoples = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//

    self.peoples = @[@"alex", @"tim", @"Paul"];
        for (NSString *string in self.peoples) {
            Friend *friend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:self.moc];
            [friend setValue:string forKey:@"name"];
            [friend setValue:@0 forKey:@"isFriend"];
            [self.moc save:nil];
        }
        [self load];
//    }];
}

-(void)load{
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Friend"];
    self.friends = [self.moc executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}

#pragma mark - Table view data source


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark) {
        //unselect
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;

        Friend *friend =[self.friends objectAtIndex:indexPath.row];
        friend.isFriend = @0;

        [self.moc save:nil];

    }else{
        //select

        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        //
        Friend *friend =[self.friends objectAtIndex:indexPath.row];
        friend.isFriend = @1;

        [self.moc save:nil];

    }



}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID2" forIndexPath:indexPath];
    Friend *friend = [self.friends objectAtIndex:indexPath.row];
    cell.textLabel.text = friend.name;
    if ([friend.isFriend isEqual:@1]) {

        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{

        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}



@end
