// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Commit.m instead.

#import "_Commit.h"

@implementation CommitID
@end

@implementation _Commit

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Commit" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Commit";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Commit" inManagedObjectContext:moc_];
}

- (CommitID*)objectID {
	return (CommitID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"commit_timestampValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"commit_timestamp"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic author_avatar_url;

@dynamic author_name;

@dynamic branch_name;

@dynamic commit_hash;

@dynamic commit_message;

@dynamic commit_timestamp;

- (int64_t)commit_timestampValue {
	NSNumber *result = [self commit_timestamp];
	return [result longLongValue];
}

- (void)setCommit_timestampValue:(int64_t)value_ {
	[self setCommit_timestamp:@(value_)];
}

- (int64_t)primitiveCommit_timestampValue {
	NSNumber *result = [self primitiveCommit_timestamp];
	return [result longLongValue];
}

- (void)setPrimitiveCommit_timestampValue:(int64_t)value_ {
	[self setPrimitiveCommit_timestamp:@(value_)];
}

@dynamic avatar;

@dynamic repository;

@end

@implementation CommitAttributes 
+ (NSString *)author_avatar_url {
	return @"author_avatar_url";
}
+ (NSString *)author_name {
	return @"author_name";
}
+ (NSString *)branch_name {
	return @"branch_name";
}
+ (NSString *)commit_hash {
	return @"commit_hash";
}
+ (NSString *)commit_message {
	return @"commit_message";
}
+ (NSString *)commit_timestamp {
	return @"commit_timestamp";
}
@end

@implementation CommitRelationships 
+ (NSString *)avatar {
	return @"avatar";
}
+ (NSString *)repository {
	return @"repository";
}
@end

