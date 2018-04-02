#import "Avatar.h"
#import "NSDictionary+Networking.h"
#import <MagicalRecord/MagicalRecord.h>

@interface Avatar ()

// Private interface goes here.

@end

@implementation Avatar

+ (instancetype)entityWithPayload:(NSData *)payload url:(NSString *)url inContext:(NSManagedObjectContext *)context{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"avatar_url == %@", url];
    Avatar *avatar = [Avatar MR_findFirstWithPredicate:predicate inContext:context];
    if (avatar == nil){
        avatar = [Avatar MR_createEntityInContext:context];
        avatar.avatar_url = url;
        avatar.avatar_data = payload;
    }
    return avatar;
}

@end
