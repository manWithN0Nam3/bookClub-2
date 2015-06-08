//
//  AddBookViewController.m
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/4/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "AddBookViewController.h"
#import "AppDelegate.h"
#import "Book.h"

@interface AddBookViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *authorTextField;
@property NSManagedObjectContext *moc;


@end

@implementation AddBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    self.moc = delegate.managedObjectContext;
//
    // Do any additional setup after loading the view.
}


- (IBAction)onButtonTapped:(UIButton *)sender {


    [self dismissViewControllerAnimated:YES completion:nil];

    Book *book = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Book class]) inManagedObjectContext:self.moc];

    [book setValue:self.titleTextField.text forKey:@"title"];
    [book setValue:self.authorTextField.text forKey:@"author"];

    [self.frienddd addBookObject:book];

    [self.moc save:nil];

}


@end
