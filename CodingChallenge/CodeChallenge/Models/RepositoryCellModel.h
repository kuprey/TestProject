

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Repository.h"

@interface RepositoryCellModel : NSObject

- (instancetype)initWithRepository:(Repository *)repository;

- (NSString *)repositoryName;
- (NSString *)repositoryDescription;
- (NSString *)author;
- (UIImage *)avatar;
- (NSNumber *)repoID;

@end
