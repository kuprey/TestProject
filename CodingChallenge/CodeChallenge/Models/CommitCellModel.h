

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Commit.h"

@interface CommitCellModel : NSObject

- (instancetype)initWithCommit:(Commit *)commit;

- (NSString *)commitName;
- (NSString *)commitHash;
- (NSString *)branch;
- (NSString *)author;
- (NSString *)timestamp;
- (UIImage *)avatar;

@end
