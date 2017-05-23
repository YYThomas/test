//
//  hero.m
//  tableview练习
//
//  Created by 俞益 on 2017/5/8.
//  Copyright © 2017年 俞益. All rights reserved.
//
/**/
#import "yyHero.h"
@implementation yyHero
//以后会用mj_objectArrayWithKeyValuesArray方法代替掉
+(instancetype)heroWithDict:(NSDictionary*)dict{
    yyHero *hero = [[self alloc] init];
//    he.name = dict[@"name"];
//    he.icon = dict[@"icon"];
//    he.intro = dict[@"intro"];
    [hero setValuesForKeysWithDictionary:dict];
    return hero;
}
@end
