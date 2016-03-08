//
//  MP_ViewController.m
//  冒泡新闻
//
//  Created by 小葵花 on 16/3/2.
//  Copyright © 2016年 泡泡. All rights reserved.
//

#import "MP_ViewController.h"

@interface MP_ViewController ()

@end

@implementation MP_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:1.000 green:0.998 blue:0.945 alpha:1.000];
    //title字体颜色大小
    self.navigationController.navigationBar.titleTextAttributes = [NSMutableDictionary titleAttributeWithFont:[UIFont systemFontOfSize:20] withColor:[UIColor whiteColor]];
    
    [UIScreen mainScreen];
    
    //返回键 颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //不受导航栏影响
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end
