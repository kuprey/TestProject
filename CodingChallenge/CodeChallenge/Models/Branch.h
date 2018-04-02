

#import <Foundation/Foundation.h>

@interface Branch : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *sha;

+ (instancetype)branchWithPayload:(NSDictionary *)payload;

@end
