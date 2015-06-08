//
//  Comment.h
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/8/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Book;

@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * textDescription;
@property (nonatomic, retain) Book *book;

@end
