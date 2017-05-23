//
//  yyTableViewCell.m
//  tableview练习
//
//  Created by 俞益 on 2017/5/17.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import "yyTableViewCell.h"
#import "yyShareView.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@interface yyTableViewCell()<UIWebViewDelegate>
@end
@implementation yyTableViewCell
+(instancetype)tableViewCell{
    return [[NSBundle mainBundle] loadNibNamed:@"yyTableViewCell" owner:self options:nil].lastObject;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [_detailBtn addTarget:self action:@selector(clickDetail) forControlEvents:UIControlEventTouchUpInside];
    [_shareBtn addTarget:self action:@selector(clickShare) forControlEvents:UIControlEventTouchUpInside];
}
-(void)clickDetail{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSURL *url= [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    webView.delegate =self;
    [webView loadRequest:request];
    NSLog(@"URL%@",url);
    [[UIApplication sharedApplication] openURL:url options:nil completionHandler:nil];
}
-(void)clickShare{
    yyShareView *shareView = [yyShareView shareView];
    shareView.frame = CGRectMake(0, Width, Width, Width);
    UIWindow *app = [[UIApplication sharedApplication] keyWindow];
    [app addSubview:shareView];
    shareView.transform = CGAffineTransformMakeTranslation(0.01, Height);
    [UIView animateWithDuration:0.3 animations:^{
        shareView.transform = CGAffineTransformMakeTranslation(0.01, 0.01);
    }];
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exit:)];
    [shareView addGestureRecognizer:recognizer];
}
-(void)exit:(UITapGestureRecognizer *)recognizer{
    [UIView animateWithDuration:0.3 animations:^{
        recognizer.view.transform = CGAffineTransformMakeTranslation(0.1, Height);
    } completion:^(BOOL finished) {
        [recognizer.view removeFromSuperview];
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
