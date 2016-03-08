//
//  NSMutableDictionary+MPTitleAttribute.m
//  冒泡新闻
//
//  Created by 小葵花 on 16/3/2.
//  Copyright © 2016年 泡泡. All rights reserved.
//

#import "NSMutableDictionary+MPTitleAttribute.h"

@implementation NSMutableDictionary (MPTitleAttribute)

+ (NSMutableDictionary *)titleAttributeWithFont:(UIFont *)font withColor:(UIColor *)color{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] =font;
    dic[NSForegroundColorAttributeName] = color;
    return dic;
}

@end
