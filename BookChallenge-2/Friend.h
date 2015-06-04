//
//  Friend.h
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/4/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Book;

@interface Friend : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *book;
@end

@interface Friend (CoreDataGeneratedAccessors)

- (void)addBookObject:(Book *)value;
- (void)removeBookObject:(Book *)value;
- (void)addBook:(NSSet *)values;
- (void)removeBook:(NSSet *)values;

@end
