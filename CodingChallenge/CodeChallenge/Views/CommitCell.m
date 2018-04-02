

#import "CommitCell.h"

@implementation CommitCell

+ (UINib *)nib{
    UINib *nib = [UINib nibWithNibName:[CommitCell identifier] bundle:[NSBundle mainBundle]];
    return nib;
}

+ (NSString *)identifier{
    NSString *identifier = [[CommitCell class] description];
    return identifier;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
