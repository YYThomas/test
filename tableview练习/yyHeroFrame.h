//
//  yyHeroFrame.h
//  tableview练习
//
//  Created by 俞益 on 2017/5/11.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import <UIKit/UIKit.h>
@class yyHero;
@interface yyHeroFrame : NSObject
@property(nonatomic,assign)CGRect iconF;
@property(nonatomic,assign)CGRect nameF;
@property(nonatomic,assign)CGRect introF;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,strong)yyHero *hero;
@end
