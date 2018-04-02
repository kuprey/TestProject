

#import <UIKit/UIKit.h>

@interface CommitCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *commitNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *commitHashLabel;
@property (nonatomic, weak) IBOutlet UILabel *branchLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UIImageView *authorAvatarImgView;

+ (UINib *)nib;
+ (NSString *)identifier;

@end
