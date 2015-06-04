//
//  Book.h
//  BookChallenge-2
//
//  Created by Alex Santorineos on 6/4/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Friend;

@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSSet *friend;
@end

@interface Book (CoreDataGeneratedAccessors)

- (void)addFriendObject:(Friend *)value;
- (void)removeFriendObject:(Friend *)value;
- (void)addFriend:(NSSet *)values;
- (void)removeFriend:(NSSet *)values;

@end
