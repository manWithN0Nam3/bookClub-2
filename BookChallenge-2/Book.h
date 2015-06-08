//
//  Book.h
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/8/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, Friend;

@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *friend;
@property (nonatomic, retain) NSSet *comment;
@end

@interface Book (CoreDataGeneratedAccessors)

- (void)addFriendObject:(Friend *)value;
- (void)removeFriendObject:(Friend *)value;
- (void)addFriend:(NSSet *)values;
- (void)removeFriend:(NSSet *)values;

- (void)addCommentObject:(Comment *)value;
- (void)removeCommentObject:(Comment *)value;
- (void)addComment:(NSSet *)values;
- (void)removeComment:(NSSet *)values;

@end
