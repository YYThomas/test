//
//  hero.h
//  tableview练习
//
//  Created by 俞益 on 2017/5/8.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface yyHero : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *intro;
+(instancetype)heroWithDict:(NSDictionary*)dict;
@end
