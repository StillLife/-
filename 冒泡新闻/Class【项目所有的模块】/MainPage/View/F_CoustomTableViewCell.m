
#import "F_CoustomTableViewCell.h"

@implementation F_CoustomTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        imageView.tag = 100;
        [self.contentView addSubview:imageView];
        UILabel *TitleLable = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, 100, 40)];
        TitleLable.tag = 101;
        [self.contentView addSubview:TitleLable];
        UILabel *detailLable = [[UILabel alloc]initWithFrame:CGRectMake(60, 55, 100, 80)];
        detailLable.tag =102;
        [self.contentView addSubview:detailLable];
        UILabel *Datelable = [[UILabel alloc]initWithFrame:CGRectMake(220, 10, 40, 30)];
        Datelable.tag = 103;
        [self.contentView addSubview:Datelable];
    }
    self.ImageView = [self viewWithTag:100];
    self.titleLable = [self viewWithTag:101];
    self.detailLable = [self viewWithTag:102];
    self.dateLable = [self viewWithTag:103];
    return self;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
