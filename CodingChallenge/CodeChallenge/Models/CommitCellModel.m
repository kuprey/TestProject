
#import "CommitCellModel.h"

@interface CommitCellModel ()

@property (weak, nonatomic) Commit *commit;

@end

@implementation CommitCellModel

- (instancetype)initWithCommit:(Commit *)commit{
    self = [super init];
    if (self){
        self.commit = commit;
    }
    return self;
}

- (NSString *)commitName{
    return self.commit.commit_message;
}

- (NSString *)commitHash{
    return self.commit.commit_hash;
}

- (NSString *)author{
    return self.commit.author_name;
}

- (UIImage *)avatar{
    UIImage *img = [[UIImage alloc] initWithData:self.commit.avatar.avatar_data];
    return img;
}

- (NSString *)branch{
    return self.commit.branch_name;
}

@end
