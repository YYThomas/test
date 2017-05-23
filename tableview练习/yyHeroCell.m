//
//  yyHeroCell.m
//  tableview练习
//
//  Created by 俞益 on 2017/5/11.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import "yyHeroCell.h"
#import "yyHero.h"
#import "yyHeroFrame.h"
#define yyNameFont [UIFont systemFontOfSize:18]
#define yyIntroFont [UIFont systemFontOfSize:22]
@interface yyHeroCell()
@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *introLabel;
@end
@implementation yyHeroCell
+(id)cellWithTableView:(UITableView *)tableView{
    static NSString *cellID = @"ms";
    yyHeroCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[yyHeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //创建头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        //创建name
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = yyNameFont;
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        //创建简介
        UILabel *introLabel = [[UILabel alloc] init];
        introLabel.font = yyIntroFont;
        introLabel.numberOfLines = 0;
        [self.contentView addSubview:introLabel];
        self.introLabel = introLabel;
    }
    return self;
}
-(void)setHeroFrame:(yyHeroFrame *)heroFrame{
    _heroFrame = heroFrame;
    [self setDataForCell];
    [self setFrameForCell];
}
-(void)setDataForCell{
    yyHero *hero = self.heroFrame.hero;
    self.iconView.image = [UIImage imageNamed:hero.icon];
    self.introLabel.text = hero.intro;
    self.nameLabel.text = hero.name;
}
-(void)setFrameForCell{
    self.iconView.frame = self.heroFrame.iconF;
    self.nameLabel.frame = self.heroFrame.nameF;
    self.introLabel.frame = self.heroFrame.introF;
}
@end
