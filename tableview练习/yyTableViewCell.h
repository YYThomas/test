//
//  yyTableViewCell.h
//  tableview练习
//
//  Created by 俞益 on 2017/5/17.
//  Copyright © 2017年 俞益. All rights reserved.
#import <UIKit/UIKit.h>

@interface yyTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *detailBtn;
@property (strong, nonatomic) IBOutlet UIButton *shareBtn;
@property (strong, nonatomic) NSString *info;
+(instancetype)tableViewCell;
@end
