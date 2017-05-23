//
//  yyImageView.h
//  tableview练习
//
//  Created by 俞益 on 2017/5/15.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import <UIKit/UIKit.h>
@class yyHeaderViewFrame;
@interface yyHeaderView : UIImageView
@property(nonatomic,strong)yyHeaderViewFrame *headerViewFrame;
@property(nonatomic,assign)BOOL selected;
//+(instancetype)imageView;
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *intro;
- (instancetype)creatImageView;
@end
