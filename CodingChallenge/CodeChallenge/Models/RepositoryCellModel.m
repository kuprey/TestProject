

#import "RepositoryCellModel.h"



@interface RepositoryCellModel ()

@property (weak, nonatomic) Repository *repository;

@end

@implementation RepositoryCellModel

- (instancetype)initWithRepository:(Repository *)repository{
    self = [super init];
    if (self != nil) {
        self.repository = repository;
    }
    return self;
}

- (NSString *)repositoryName{
    return self.repository.repo_name;
}

- (NSString *)repositoryDescription{
    return self.repository.short_description;
}

- (NSString *)author{
    return self.repository.owner;
}

- (UIImage *)avatar{
    UIImage *img = [[UIImage alloc] initWithData:self.repository.avatar.avatar_data];
    return img;
}

- (NSNumber *)repoID{
    return self.repository.repo_id;
}


@end
