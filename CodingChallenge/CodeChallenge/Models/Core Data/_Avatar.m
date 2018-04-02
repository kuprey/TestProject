// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Avatar.m instead.

#import "_Avatar.h"

@implementation AvatarID
@end

@implementation _Avatar

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Avatar" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Avatar";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Avatar" inManagedObjectContext:moc_];
}

- (AvatarID*)objectID {
	return (AvatarID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic avatar_data;

@dynamic avatar_url;

@dynamic commit;

@dynamic repository;

@end

@implementation AvatarAttributes 
+ (NSString *)avatar_data {
	return @"avatar_data";
}

+ (NSString *)avatar_url{
    return @"avatar_url";
}
@end

@implementation AvatarRelationships 
+ (NSString *)commit {
	return @"commit";
}
+ (NSString *)repository {
	return @"repository";
}
@end

