//
//  yyImageViewFrame.h
//  tableview练习
//
//  Created by 俞益 on 2017/5/16.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "yyHero.h"
@class yyHero;
@interface yyHeaderViewFrame : UIImageView
@property(nonatomic,strong)yyHero *hero;
@property(nonatomic,assign)CGRect iconF;
@property(nonatomic,assign)CGRect nameF;
@property(nonatomic,assign)CGRect introF;
@property(nonatomic,assign)CGRect imageFrame;
@property(nonatomic,assign)CGFloat cellHeight;
@end
