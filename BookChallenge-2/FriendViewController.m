//
//  FriendViewController.m
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/4/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "FriendViewController.h"
#import "Book.h"
#import "BookViewController.h"

@interface FriendViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *nameTextLabel;
@property (nonatomic) NSArray *books;

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadMember];

    self.nameTextLabel.text = self.frienddd.name;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.books.count;
}



-(void)loadMember{

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Book"];

    //it will match up friend entity and Book entity
    request.predicate = [NSPredicate predicateWithFormat:@"team CONTAINS %@", self.frienddd];
    NSLog(@"%@",self.frienddd);
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
    id moc = [(id)[UIApplication sharedApplication].delegate valueForKey:@"managedObjectContext"];
    self.books = [moc executeFetchRequest:request error:nil];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellBook"];
    cell.textLabel.text = [[self.books objectAtIndex:indexPath.row]title];
//    Book *book =self.books[indexPath.row];

//    cell.textLabel.text = self.books.title;

    return cell;
}
//
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//
//    UINavigationController *nVc = segue.destinationViewController;
//    BookViewController *vc = nVc.viewControllers[0];
//    vc.team = self.teeeeeem;
//    
//    
//}

@end
