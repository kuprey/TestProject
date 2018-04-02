#import "_Avatar.h"

@interface Avatar : _Avatar
// Custom logic goes here.
+ (instancetype)entityWithPayload:(NSData *)payload
                              url:(NSString *)url
                        inContext:(NSManagedObjectContext *)context;



@end
