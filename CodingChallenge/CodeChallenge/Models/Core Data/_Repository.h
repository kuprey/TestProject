// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Repository.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Avatar;
@class Commit;

@interface RepositoryID : NSManagedObjectID {}
@end

@interface _Repository : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RepositoryID *objectID;

@property (nonatomic, strong, nullable) NSData* image;

@property (nonatomic, strong, nullable) NSString* image_url;

@property (nonatomic, strong, nullable) NSString* owner;

@property (nonatomic, strong, nullable) NSNumber* rank;

@property (atomic) int64_t rankValue;
- (int64_t)rankValue;
- (void)setRankValue:(int64_t)value_;

@property (nonatomic, strong, nullable) NSNumber* repo_id;

@property (atomic) int64_t repo_idValue;
- (int64_t)repo_idValue;
- (void)setRepo_idValue:(int64_t)value_;

@property (nonatomic, strong, nullable) NSString* repo_name;

@property (nonatomic, strong, nullable) NSString* short_description;

@property (nonatomic, strong, nullable) Avatar *avatar;

@property (nonatomic, strong, nullable) NSSet<Commit*> *commits;
- (nullable NSMutableSet<Commit*>*)commitsSet;

@end

@interface _Repository (CommitsCoreDataGeneratedAccessors)
- (void)addCommits:(NSSet<Commit*>*)value_;
- (void)removeCommits:(NSSet<Commit*>*)value_;
- (void)addCommitsObject:(Commit*)value_;
- (void)removeCommitsObject:(Commit*)value_;

@end

@interface _Repository (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSData*)primitiveImage;
- (void)setPrimitiveImage:(nullable NSData*)value;

- (nullable NSString*)primitiveImage_url;
- (void)setPrimitiveImage_url:(nullable NSString*)value;

- (nullable NSString*)primitiveOwner;
- (void)setPrimitiveOwner:(nullable NSString*)value;

- (nullable NSNumber*)primitiveRank;
- (void)setPrimitiveRank:(nullable NSNumber*)value;

- (int64_t)primitiveRankValue;
- (void)setPrimitiveRankValue:(int64_t)value_;

- (nullable NSNumber*)primitiveRepo_id;
- (void)setPrimitiveRepo_id:(nullable NSNumber*)value;

- (int64_t)primitiveRepo_idValue;
- (void)setPrimitiveRepo_idValue:(int64_t)value_;

- (nullable NSString*)primitiveRepo_name;
- (void)setPrimitiveRepo_name:(nullable NSString*)value;

- (nullable NSString*)primitiveShort_description;
- (void)setPrimitiveShort_description:(nullable NSString*)value;

- (Avatar*)primitiveAvatar;
- (void)setPrimitiveAvatar:(Avatar*)value;

- (NSMutableSet<Commit*>*)primitiveCommits;
- (void)setPrimitiveCommits:(NSMutableSet<Commit*>*)value;

@end

@interface RepositoryAttributes: NSObject 
+ (NSString *)image;
+ (NSString *)image_url;
+ (NSString *)owner;
+ (NSString *)rank;
+ (NSString *)repo_id;
+ (NSString *)repo_name;
+ (NSString *)short_description;
@end

@interface RepositoryRelationships: NSObject
+ (NSString *)avatar;
+ (NSString *)commits;
@end

NS_ASSUME_NONNULL_END
