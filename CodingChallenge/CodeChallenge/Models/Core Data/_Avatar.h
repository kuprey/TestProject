// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Avatar.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Commit;
@class Repository;

@interface AvatarID : NSManagedObjectID {}
@end

@interface _Avatar : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AvatarID *objectID;

@property (nonatomic, strong, nullable) NSData* avatar_data;

@property (nonatomic, strong, nullable) NSString* avatar_url;

@property (nonatomic, strong, nullable) Commit *commit;

@property (nonatomic, strong, nullable) Repository *repository;

@end

@interface _Avatar (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSData*)primitiveAvatar_data;
- (void)setPrimitiveAvatar_data:(nullable NSData*)value;

- (nullable NSString*)primitiveAvatar_url;
- (void)setPrimitiveAvatar_url:(nullable NSString*)value;

- (Commit*)primitiveCommit;
- (void)setPrimitiveCommit:(Commit*)value;

- (Repository*)primitiveRepository;
- (void)setPrimitiveRepository:(Repository*)value;

@end

@interface AvatarAttributes: NSObject 
+ (NSString *)avatar_data;
+ (NSString *)avatar_url;
@end

@interface AvatarRelationships: NSObject
+ (NSString *)commit;
+ (NSString *)repository;
@end

NS_ASSUME_NONNULL_END
