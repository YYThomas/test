//
//  yysegment.m
//  tableview练习
//
//  Created by 俞益 on 2017/5/17.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import "yysegment.h"
#import "Masonry.h"
@implementation yysegment
+(instancetype)segment{
    return [[NSBundle mainBundle] loadNibNamed:@"yysegment" owner:self options:nil].lastObject;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    //尺寸去viewController中设置
    [self.segmentView setTitle:@"法师" forSegmentAtIndex:0];
    [self.segmentView setTitle:@"战士" forSegmentAtIndex:1];
    [self.segmentView setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [self.segmentView setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
    [self.segmentView addTarget:self action:@selector(click) forControlEvents:UIControlEventValueChanged];
}

-(void)click{
    //算出bottomView移动位置
    [UIView animateWithDuration:0.3 animations:^{
        //这里只需要保持bottomView的宽高相同，不需要设置，只需要改变下center位置
        CGPoint point = self.bottomView.center;
        float x = (self.segmentView.selectedSegmentIndex == 0)?self.segmentView.center.x *0.5:self.segmentView.center.x * 1.5;
        point = CGPointMake(x, point.y);
        self.bottomView.center = point;
    }];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self setConstraitsForView];
}
-(void)setConstraitsForView{
    [self setConstraitsForSegment];
    [self setConstraitsForBottomView];
}
#pragma mark -- segment尺寸约束
-(void)setConstraitsForSegment{
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom).offset(-3);
    }];
}
#pragma mark -- bottomView尺寸约束
-(void)setConstraitsForBottomView{
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.segmentView.mas_centerX).multipliedBy(0.5);
        make.top.equalTo(self.segmentView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(self.segmentView.frame.size.width*0.3, 3));
    }];

}
@end
