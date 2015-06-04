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
@property NSMutableArray *names;
@property NSManagedObjectContext *moc;

@end

@implementation PeopleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.moc = appDelegate.managedObjectContext;

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/18/friends.json"]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.peoples = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        [self.tableView reloadData];
    }];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.peoples.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark) {
        //unselect
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        //
//        NSString *friendString = self.peoples[indexPath.row];
//        NSManagedObject *friend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:self.moc];
//
// [self.moc deleteObject:[self.ultimateCharacters objectAtIndex:self.cellToDelete]];

    }else{
        //select

        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;

        NSString *friendString = self.peoples[indexPath.row];
         NSManagedObject *friend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:self.moc];
        [friend setValue:friendString forKey:@"name"];
        NSLog(@"%@----------============--------======",friendString);

        [self.moc save:nil];
        [self load];
    }



}

-(void)load{
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Friend"];
    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    request.sortDescriptors = @[sortDescriptor1];
//    self.peoples =self.names;

    self.peoples = [self.moc executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID2" forIndexPath:indexPath];
//    Friend *friend = [self.peoples objectAtIndex:indexPath.row];
    cell.textLabel.text = [self.peoples objectAtIndex:indexPath.row];
;
    return cell;
}



@end
