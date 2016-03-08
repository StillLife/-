

#import <UIKit/UIKit.h>

@interface F_CoustomTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *ImageView;
@property(nonatomic,strong) UILabel *titleLable;
@property(nonatomic,strong)UILabel *detailLable;
@property(nonatomic,strong)UILabel *dateLable;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
