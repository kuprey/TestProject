

#import "NSDictionary+Networking.h"

@implementation NSDictionary (Networking)

- (id)networkObjectForKey:(NSString *)key {
    if (key == nil) {
        return nil;
    }

    id value = [self objectForKey:key];

    if([value isKindOfClass:[NSNull class]] || [value isMemberOfClass:[NSNull class]]) {
        return nil;
    } else {
        return value;
    }
}

+ (instancetype)dictionaryWithData:(NSData *)data{
    NSError* error;
    id object = [NSJSONSerialization JSONObjectWithData:data
                                                 options:kNilOptions
                                                   error:&error];
    NSDictionary* json;
    if ([object respondsToSelector:@selector(allKeys)]){
        json = object;
    }else{
        json = @{@"items":object};
    }
    
    return json;
}

@end
