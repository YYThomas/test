//
//  heroView.m
//  tableview练习
//
//  Created by 俞益 on 2017/5/8.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import "yyHeroView.h"
#import "Masonry.h"
@interface yyHeroView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(strong,nonatomic) NSTimer *timer;
@end
@implementation yyHeroView
+(instancetype)heroView{
    return [[NSBundle mainBundle] loadNibNamed:@"yyHeroView" owner:nil options:nil].lastObject;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    //相关初始化工作
    [self setup];
}
-(void)setup{
    //self.scrollView.delegate =self;已经通过拖拉实现代理
    [self startTimer];
}
-(void)setImages:(NSArray *)images{
    _images = images;
    NSUInteger count = _images.count;
    for (int i = 0; i<count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:self.images[i]];
        [self.scrollView addSubview:imageView];
    }
}
//父控件尺寸改变了，子控件尺寸就要重新设置,
/*
 layoutSubviews为什么会调用两次：
 1、在viewControll中有个addsubview：heroView
 2、在viewControll中setConstraintsForheroView改变了heroView的尺寸
 问题：刚开始heroview没有尺寸信息，也没有定义大小，其子控件有大小，因为是xib中定义了
 1、addsubview时候第一次触发了layoutSubviews：
 这时候的scrollW应该是xib中的大小
 这里触发了setConstraints，尺寸信息有，但都是错误的，只是提供了个约束，到heroView尺寸定下来才确定它们的尺寸，这里只是设定了相对位置
 2.setConstraintsForheroView第二次触发layoutSubviews时
 这里设置了尺寸信息了
 
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat scrollW = self.scrollView.frame.size.width;
    CGFloat scrollH = self.scrollView.frame.size.height;
    // 设置内容大小
    self.scrollView.contentSize = CGSizeMake(self.images.count * scrollW, 0);
    self.scrollView.pagingEnabled = YES;
    // 设置所有imageView的frame
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * scrollW, 0, scrollW, scrollH);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    [self setConstraints];
}
//改变page号
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int pageNumber = (int)(self.scrollView.contentOffset.x / self.scrollView.frame.size.width + 0.5);
    self.pageControl.currentPage = pageNumber;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}
-(void)startTimer{
    //这里要启动下时间源
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
}

-(void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)nextPage{
    NSInteger page = self.pageControl.currentPage+1;
    if (page == self.pageControl.numberOfPages) {
        page = 0;
    }
    //算出当前需要的contentsize
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = page * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark scrollView和pageControl布局
-(void)setConstraints{
    //设置scrollView
    [self setContratintsForScrollView:self.scrollView];
    //设置tableView
    [self setContratintsForPageControl:self.pageControl];
}

#pragma mark scrollView布局
/*
 完全与superView（self）重合
 */
-(void)setContratintsForScrollView:(UIScrollView*) scrollView{
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_width);
        make.height.equalTo(self.mas_height);
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
    }];
}
#pragma mark pageControl布局
/*
 宽度为self.width的0.6倍
 高度为self.height的0.1倍
 中心与其superView（self）对齐
 底部与superView（self）对齐
 */
-(void)setContratintsForPageControl:(UIPageControl *)pageControl{
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(self.mas_width).multipliedBy(0.6);
        make.height.equalTo(self.mas_height).multipliedBy(0.1);
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom);
    }];
}
@end
