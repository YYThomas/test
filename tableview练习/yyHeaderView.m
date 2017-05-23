//
//  yyImageView.m
//  tableview练习
//
//  Created by 俞益 on 2017/5/15.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import "yyHeaderView.h"
#import "yyHeaderViewFrame.h"
#define yyNameFont [UIFont systemFontOfSize:18]
#define yyIntroFont [UIFont systemFontOfSize:22]
@implementation yyHeaderView
-(instancetype)creatImageView{
    yyHeaderView *headerView = [[yyHeaderView alloc] init];
    //创建头像
    UIImageView *iconView = [[UIImageView alloc] init];
    [headerView addSubview:iconView];
    headerView.icon = iconView;
    //创建name
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = yyNameFont;
    [headerView addSubview:nameLabel];
    headerView.name = nameLabel;
    //创建简介
    UILabel *introLabel = [[UILabel alloc] init];
    introLabel.font = yyIntroFont;
    introLabel.numberOfLines = 0;
    [headerView addSubview:introLabel];
    headerView.intro = introLabel;
    headerView.selected = NO;
    headerView.userInteractionEnabled = YES;
    return headerView;
}
-(void)setHeaderViewFrame:(yyHeaderViewFrame *)headerViewFrame{
    _headerViewFrame = headerViewFrame;
    [self setFrameForCell];
    [self setDataForCell];
}
-(void)setDataForCell{
    yyHero *hero = self.headerViewFrame.hero;
    self.intro.text = hero.intro;
    self.name.text = hero.name;
}
-(void)setFrameForCell{
    self.icon.frame = self.headerViewFrame.iconF;
    self.name.frame = self.headerViewFrame.nameF;
    self.intro.frame = self.headerViewFrame.introF;
    self.frame = self.headerViewFrame.imageFrame;
}
@end
