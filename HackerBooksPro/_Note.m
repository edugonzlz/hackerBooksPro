// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Note.m instead.

#import "_Note.h"

@implementation NoteID
@end

@implementation _Note

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (NoteID*)objectID {
	return (NoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic text;

@dynamic book;

@dynamic location;

@dynamic photo;

@end

@implementation NoteAttributes 
+ (NSString *)creationDate {
	return @"creationDate";
}
+ (NSString *)modificationDate {
	return @"modificationDate";
}
+ (NSString *)text {
	return @"text";
}
@end

@implementation NoteRelationships 
+ (NSString *)book {
	return @"book";
}
+ (NSString *)location {
	return @"location";
}
+ (NSString *)photo {
	return @"photo";
}
@end

