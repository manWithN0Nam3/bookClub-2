//
//  BookViewController.m
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/4/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "BookViewController.h"
#import "AppDelegate.h"


@interface BookViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorTextLabel;
@property Comment *comment;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSManagedObjectContext *moc;
@property NSArray *comments;
@end

@implementation BookViewController

- (void)viewDidLoad {

    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    self.moc = delegate.managedObjectContext;


    [super viewDidLoad];
    NSLog(@"%@",self.book);
    self.titleTextLabel.text = self.book.title;
    self.title = self.book.title;
    self.authorTextLabel.text = self.book.author;
}

- (IBAction)onButtonTapped:(UIBarButtonItem *)sender {

    UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"add Comment" message:@"👩‍👩‍👧😷😜" preferredStyle:UIAlertControllerStyleAlert];

    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"addComment";
    }];


    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *save = [UIAlertAction actionWithTitle:@"save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *textField0 = alertController.textFields[0];
        NSString *commentTextField = textField0.text;

        Comment *comment = [NSEntityDescription insertNewObjectForEntityForName:@"Comment" inManagedObjectContext:self.moc];
        [comment setValue:commentTextField forKey:@"textDescription"];
        [self.book addCommentObject:comment];

        [self.moc save:nil];
        [self load];
    }];

    [alertController addAction:save];
    [alertController addAction:cancel];
    [self presentViewController:alertController animated:YES completion:nil];
    //    [self.tableView reloadData];
    [self load];




}

-(void)load{
//    self.comment = [self.book.comment allObjects];
    self.comments = [self.book.comment allObjects];

    [self.tableView reloadData];


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.comments.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellComment"];
    Comment *comment = [self.comments objectAtIndex:indexPath.row];

    cell.textLabel.text = comment.textDescription;
    return cell;


}

@end
