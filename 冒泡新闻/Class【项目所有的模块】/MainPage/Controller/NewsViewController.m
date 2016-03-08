

#import "NewsViewController.h"
#import "SelfViewController.h"
#import "CollectionViewController.h"
///     <F>
#import "F_CoustomTableViewCell.h"
///     </F>
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *selectTypeScrollView;
    UISegmentedControl *selectTypeSegmentControl;
    UIScrollView *newsShowScrollView;
    UIView *selfView;
    UITableView *backgroudTableview;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"冒泡新闻";
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self createTableview];
    [self addSelectTypeView];
    [self addButtonItem];
}
///     <F>
#pragma mark-------tableView
-(void)createTableview{
    backgroudTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT-60) style:UITableViewStyleGrouped];
    backgroudTableview.dataSource = self;
    backgroudTableview.delegate = self;
    backgroudTableview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:backgroudTableview];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    F_CoustomTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (!cell) {
        cell = [[F_CoustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
        cell.titleLable.text = @"aaa";
        cell.detailLable.text = @"bbb";
        cell.dateLable.text = @"2015";
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
///     </F>
#pragma mark-------左右视图按钮
- (void)addButtonItem{
    //左侧视图
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"self"] style:UIBarButtonItemStylePlain target:self action:@selector(selfCenter:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    //右侧视图
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"collection" ]style:UIBarButtonItemStylePlain target:self action:@selector(collection:)];;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}
#pragma mark------- 添加分类条
- (void)addSelectTypeView{
    selectTypeScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    //是否显示水平滚条
    selectTypeScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:selectTypeScrollView];
    
    NSArray *itemsArray = @[@"头条",@"NBA",@"手机",@"移动互联",@"娱乐",@"时尚",@"电影",@"科技"];
    selectTypeSegmentControl = [[UISegmentedControl alloc]initWithItems:itemsArray];
    selectTypeSegmentControl.frame = CGRectMake(0, 5, 0, 60);
    //清空选中框和选中状态下的颜色
    selectTypeSegmentControl.tintColor = [UIColor clearColor];
    selectTypeSegmentControl.selectedSegmentIndex = 0;
    //使控件根据内容自动适应宽高
    [selectTypeSegmentControl sizeToFit];
    [selectTypeScrollView addSubview:selectTypeSegmentControl];
    selectTypeScrollView.contentSize = CGSizeMake(CGRectGetWidth(selectTypeSegmentControl.frame), 0);
    
    //正常状态下的文字
    NSMutableDictionary *dic = [NSMutableDictionary titleAttributeWithFont:[UIFont systemFontOfSize:15] withColor:[UIColor grayColor]];
    [selectTypeSegmentControl setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    //选中状态下的文字
    NSMutableDictionary *dicClick = [NSMutableDictionary titleAttributeWithFont:[UIFont systemFontOfSize:19] withColor:[UIColor redColor]];
    [selectTypeSegmentControl setTitleTextAttributes:dicClick forState:UIControlStateSelected];
    
    //根据文字多少 自动分配宽度
    selectTypeSegmentControl.apportionsSegmentWidthsByContent = YES;
}

#pragma mark======== 个人中心
- (void)selfCenter:(UIBarButtonItem *)sender{
//    SelfViewController *selfCenter = [[SelfViewController alloc]init];
//    [self.navigationController pushViewController:selfCenter animated:YES];
///     <F>
//    如果selfView没有被初始化就初始化并且移动出来，如果已经初始化就进行移除
    if (!selfView) {
        selfView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, SCREEN_HEIGHT)];
        self.title = @"个人中心";
        selfView.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:selfView];
        [UIView animateWithDuration:0.1 animations:^{
            selfView.frame = CGRectMake(0, 0, SCREEN_WIDTH-61, SCREEN_HEIGHT);
            backgroudTableview.frame = CGRectMake(SCREEN_WIDTH-61, 60, SCREEN_WIDTH, SCREEN_HEIGHT);
        }];
    }
    else{
        [UIView animateWithDuration:0.1 animations:^{
            selfView.frame = CGRectMake(0, 0, 0, 0);
            backgroudTableview.frame = CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT-60);
        }];
        self.title = @"冒泡新闻";
         selfView = nil;
        [selfView removeFromSuperview];
    }
///     </F>
}
#pragma mark======== 收藏
- (void)collection:(UIBarButtonItem *)sender{
    CollectionViewController *collection = [[CollectionViewController alloc]init];
    [self.navigationController pushViewController:collection
 animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
