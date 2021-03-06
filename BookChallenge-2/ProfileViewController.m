//
//  FriendViewController.m
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/4/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "ProfileViewController.h"
#import "Book.h"
#import "BookViewController.h"
#import "AddBookViewController.h"

@interface ProfileViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *nameTextLabel;
@property (nonatomic) NSArray *books;
@property Book *book;


@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.nameTextLabel.text = self.frienddd.name;

    [self load];
}

-(void)viewDidAppear:(BOOL)animated{

    [self load];
}




- (void)load{

    self.books = [self.frienddd.book allObjects];
    [self.tableView reloadData];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellBook"];

    self.book = [self.books objectAtIndex:indexPath.row];
    cell.textLabel.text = self.book.title;
    cell.detailTextLabel.text = self.book.author;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqual:@"commentID"]) {

        BookViewController *dVc = segue.destinationViewController;
        dVc.book = self.book;

    }
    else{

        UINavigationController *nVc = segue.destinationViewController;
        AddBookViewController *vc = nVc.viewControllers[0];
        vc.frienddd = self.frienddd;
    }
}

@end
