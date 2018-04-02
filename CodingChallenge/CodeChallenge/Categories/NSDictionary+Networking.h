

#import <Foundation/Foundation.h>

@interface NSDictionary (Networking)

- (id)networkObjectForKey:(NSString *)key;
+ (instancetype)dictionaryWithData:(NSData *)data;
    
@end
