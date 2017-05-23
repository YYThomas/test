//
//  yyShareView.m
//  tableview练习
//
//  Created by 俞益 on 2017/5/17.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import "yyShareView.h"
@implementation yyShareView
+(instancetype)shareView{
    return [[NSBundle mainBundle] loadNibNamed:@"yyShareView" owner:self options:nil].lastObject;
}
//-(void)awakeFromNib{
//    [super awakeFromNib];
//    CGFloat x = [UIScreen mainScreen].bounds.origin.x / 2;
//    CGFloat y = [UIScreen mainScreen].bounds.origin.y / 2;
//    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    CGFloat height = [UIScreen mainScreen].bounds.size.height ;
//    self.frame = CGRectMake(0, height, width, height);
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
