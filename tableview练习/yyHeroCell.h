//
//  yyHeroCell.h
//  tableview练习
//
//  Created by 俞益 on 2017/5/11.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import <UIKit/UIKit.h>
@class yyHeroFrame;
@interface yyHeroCell : UITableViewCell
@property(nonatomic,strong)yyHeroFrame *heroFrame;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
