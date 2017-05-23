//
//  heroView.h
//  tableview练习
//
//  Created by 俞益 on 2017/5/8.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface yyHeroView : UIView
+(instancetype)heroView;
@property(copy,nonatomic) NSArray *images;
@property(assign,nonatomic)CGSize *size;
@end
