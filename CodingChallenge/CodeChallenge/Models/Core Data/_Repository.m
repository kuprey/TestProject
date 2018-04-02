// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Repository.m instead.

#import "_Repository.h"

@implementation RepositoryID
@end

@implementation _Repository

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Repository" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Repository";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Repository" inManagedObjectContext:moc_];
}

- (RepositoryID*)objectID {
	return (RepositoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"rankValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"rank"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"repo_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"repo_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic image;

@dynamic image_url;

@dynamic owner;

@dynamic rank;

- (int64_t)rankValue {
	NSNumber *result = [self rank];
	return [result longLongValue];
}

- (void)setRankValue:(int64_t)value_ {
	[self setRank:@(value_)];
}

- (int64_t)primitiveRankValue {
	NSNumber *result = [self primitiveRank];
	return [result longLongValue];
}

- (void)setPrimitiveRankValue:(int64_t)value_ {
	[self setPrimitiveRank:@(value_)];
}

@dynamic repo_id;

- (int64_t)repo_idValue {
	NSNumber *result = [self repo_id];
	return [result longLongValue];
}

- (void)setRepo_idValue:(int64_t)value_ {
	[self setRepo_id:@(value_)];
}

- (int64_t)primitiveRepo_idValue {
	NSNumber *result = [self primitiveRepo_id];
	return [result longLongValue];
}

- (void)setPrimitiveRepo_idValue:(int64_t)value_ {
	[self setPrimitiveRepo_id:@(value_)];
}

@dynamic repo_name;

@dynamic short_description;

@dynamic avatar;

@dynamic commits;

- (NSMutableSet<Commit*>*)commitsSet {
	[self willAccessValueForKey:@"commits"];

	NSMutableSet<Commit*> *result = (NSMutableSet<Commit*>*)[self mutableSetValueForKey:@"commits"];

	[self didAccessValueForKey:@"commits"];
	return result;
}

@end

@implementation RepositoryAttributes 
+ (NSString *)image {
	return @"image";
}
+ (NSString *)image_url {
	return @"image_url";
}
+ (NSString *)owner {
	return @"owner";
}
+ (NSString *)rank {
	return @"rank";
}
+ (NSString *)repo_id {
	return @"repo_id";
}
+ (NSString *)repo_name {
	return @"repo_name";
}
+ (NSString *)short_description {
	return @"short_description";
}
@end

@implementation RepositoryRelationships 
+ (NSString *)avatar {
	return @"avatar";
}
+ (NSString *)commits {
	return @"commits";
}
@end

