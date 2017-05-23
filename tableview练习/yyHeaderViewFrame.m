//
//  yyImageViewFrame.m
//  tableview练习
//
//  Created by 俞益 on 2017/5/16.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import "yyHeaderViewFrame.h"
#import "yyHero.h"
#define yyNameFont [UIFont systemFontOfSize:18]
#define yyTextFont [UIFont systemFontOfSize:22]
@implementation yyHeaderViewFrame
-(void)setHero:(yyHero *)hero{
    _hero = hero;
    CGFloat padding = 10;
    // 设置头像的frame
    CGFloat iconViewX = padding;
    CGFloat iconViewY = padding;
    CGFloat iconViewW = 30;
    CGFloat iconViewH = 30;
    self.iconF = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);

    // 设置name的frame
    // name的x = 头像最大的x + 间隙
    CGFloat nameLabelX = CGRectGetMaxX(self.iconF) + padding;
    // 计算文字的宽高
    CGSize nameSize = [self sizeWithString:_hero.name font:yyNameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameLabelH = nameSize.height;
    CGFloat nameLabelW = nameSize.width;
    CGFloat nameLabelY = iconViewY + (iconViewH - nameLabelH) * 0.5;
    self.nameF = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    
    // 设置intro的frame
    CGFloat introLabelX = iconViewX;
    CGFloat introLabelY = CGRectGetMaxY(self.iconF) + padding;
    CGSize textSize =  [self sizeWithString:_hero.intro font:yyTextFont maxSize:CGSizeMake(300, MAXFLOAT)];
    CGFloat introLabelW = textSize.width;
    CGFloat introLabelH = textSize.height;
    self.introF = CGRectMake(introLabelX, introLabelY, introLabelW, introLabelH);
    
    //计算总体行高
    self.cellHeight = CGRectGetMaxY(self.introF);
    //self.imageFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.cellHeight);
}
//自适应高度
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName : font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围,整个文本将以每行组成的矩形为单位计算整个文本的尺寸
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}
@end
