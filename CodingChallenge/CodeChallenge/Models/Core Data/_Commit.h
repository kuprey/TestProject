// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Commit.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Avatar;
@class Repository;

@interface CommitID : NSManagedObjectID {}
@end

@interface _Commit : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CommitID *objectID;

@property (nonatomic, strong, nullable) NSString* author_avatar_url;

@property (nonatomic, strong, nullable) NSString* author_name;

@property (nonatomic, strong, nullable) NSString* branch_name;

@property (nonatomic, strong, nullable) NSString* commit_hash;

@property (nonatomic, strong, nullable) NSString* commit_message;

@property (nonatomic, strong, nullable) NSNumber* commit_timestamp;

@property (atomic) int64_t commit_timestampValue;
- (int64_t)commit_timestampValue;
- (void)setCommit_timestampValue:(int64_t)value_;

@property (nonatomic, strong, nullable) Avatar *avatar;

@property (nonatomic, strong, nullable) Repository *repository;

@end

@interface _Commit (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSString*)primitiveAuthor_avatar_url;
- (void)setPrimitiveAuthor_avatar_url:(nullable NSString*)value;

- (nullable NSString*)primitiveAuthor_name;
- (void)setPrimitiveAuthor_name:(nullable NSString*)value;

- (nullable NSString*)primitiveBranch_name;
- (void)setPrimitiveBranch_name:(nullable NSString*)value;

- (nullable NSString*)primitiveCommit_hash;
- (void)setPrimitiveCommit_hash:(nullable NSString*)value;

- (nullable NSString*)primitiveCommit_message;
- (void)setPrimitiveCommit_message:(nullable NSString*)value;

- (nullable NSNumber*)primitiveCommit_timestamp;
- (void)setPrimitiveCommit_timestamp:(nullable NSNumber*)value;

- (int64_t)primitiveCommit_timestampValue;
- (void)setPrimitiveCommit_timestampValue:(int64_t)value_;

- (Avatar*)primitiveAvatar;
- (void)setPrimitiveAvatar:(Avatar*)value;

- (Repository*)primitiveRepository;
- (void)setPrimitiveRepository:(Repository*)value;

@end

@interface CommitAttributes: NSObject 
+ (NSString *)author_avatar_url;
+ (NSString *)author_name;
+ (NSString *)branch_name;
+ (NSString *)commit_hash;
+ (NSString *)commit_message;
+ (NSString *)commit_timestamp;
@end

@interface CommitRelationships: NSObject
+ (NSString *)avatar;
+ (NSString *)repository;
@end

NS_ASSUME_NONNULL_END
