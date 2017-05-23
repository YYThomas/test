//
//  ViewController.m
//  tableview练习
//
//  Created by 俞益 on 2017/5/8.
//  Copyright © 2017年 俞益. All rights reserved.
//
/*新需求
 要求点击每个yyHeroCell会弹出一个operationTableviewcell（自定义个）
 左边可以查看英雄故事，右边分享英雄
 设计思路：
 1、让yyHeroCell成为operationTableviewcell的header
 2、点击yyHeroCell，有个监听方法，
 */
#import "ViewController.h"
#import "yyHero.h"
#import "yyHeroView.h"
#import "Masonry.h"
#import "MJExtension.h"
#import "yyHeroCell.h"
#import "yyHeroFrame.h"
#import "yyHeaderView.h"
#import "yyHeaderViewFrame.h"
#import "yyTableViewCell.h"
#import "yysegment.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(copy,nonatomic) NSArray *heroesFrame;
@property(strong,nonatomic) yysegment *segmentView;
@property(strong,nonatomic) yyHeroView *heroView;
//@property(strong,nonatomic) yyImageView *headerView;
@property(copy,nonatomic) NSArray *headerFrame;
@property(copy,nonatomic)NSArray *headerArray;
@property(strong,nonatomic) UIView *firstView;
@property(strong,nonatomic) UIView *secondView;
@end
@implementation ViewController
/*
 1、遇到header向上滑动时会和cell重合现象，将tableview样式改为group，背景色换下
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    //设置自动布局
    [self setConstraints];
    //我是标记
}
#pragma mark -- 设置view
-(void)setUpView{
    //    self.firstView = [[UIView alloc] init];
    //    self.firstView.hidden = NO;
    //    self.firstView.backgroundColor = [UIColor yellowColor];
    //    [self.view addSubview:self.firstView];
    
    self.secondView = [[UIView alloc] init];
    self.secondView.backgroundColor = [UIColor yellowColor];
    self.secondView.hidden = YES;
    [self.tableView addSubview:self.secondView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.heroView = [yyHeroView heroView];
    self.heroView.images = @[@"192131975792",@"173890255948",@"173890450691",@"178647406694",@"193333009937"];
    [self.view addSubview:self.heroView];
    
    self.segmentView = [yysegment segment];
    [self.segmentView.segmentView addTarget:self action:@selector(clickSegment) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentView];
}
//懒加载
/*
 MJExtension是一套字典和模型之间互相转换的超轻量级框架
 MJExtension能完成的功能
 字典（JSON） --> 模型（Model）
 模型（Model） --> 字典（JSON）
 字典数组（JSON Array） --> 模型数组（Model Array）
 模型数组（Model Array） --> 字典数组（JSON Array）
 */
#pragma mark -heroesFrame 懒加载方法
-(NSArray *)heroesFrame{
    if (_heroesFrame == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heroes.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *heroFrameArray = [[NSMutableArray alloc] init];
        NSDictionary *dict = [[NSDictionary alloc] init];
        for (int i = 0; i<array.count; i++) {
            dict = array[i];
            yyHero *hero = [yyHero heroWithDict:dict];
            yyHeroFrame *heroFrame = [[yyHeroFrame alloc] init];
            //设置了尺寸
            heroFrame.hero = hero;
            [heroFrameArray addObject:heroFrame];
            //NSLog(@"heroFrame:%@",heroFrame);
        }
        _heroesFrame = heroFrameArray;
    }
    return _heroesFrame;
}
-(NSArray *)headerFrame{
    if (_headerFrame == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heroes.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *heroFrameArray = [[NSMutableArray alloc] init];
        NSDictionary *dict = [[NSDictionary alloc] init];
        for (int i = 0; i<array.count; i++) {
            dict = array[i];
            yyHero *hero = [yyHero heroWithDict:dict];
            yyHeaderViewFrame *imageViewFrame = [[yyHeaderViewFrame alloc] init];
            //设置了尺寸
            imageViewFrame.hero = hero;
            [heroFrameArray addObject:imageViewFrame];
        }
        _headerFrame = heroFrameArray;
    }
    return _headerFrame;
}
-(NSArray *)headerArray{
    if (_headerArray ==nil) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i = 0; i<self.headerFrame.count; i++) {
            yyHeaderViewFrame *frame = self.headerFrame[i];
            yyHeaderView *headerView = [[yyHeaderView alloc] creatImageView];
            headerView.headerViewFrame = frame;
            headerView.tag = i;
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeaderView:)];
            [headerView addGestureRecognizer:recognizer];
            [array addObject:headerView];
        }
        _headerArray = array;
    }
    return _headerArray;
}
#pragma mark -返回 yyHeroCell方法
-(id)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    yyTableViewCell *cell = [yyTableViewCell tableViewCell];//创建一个没有内容，没有尺寸，只有控件的cell
    cell.backgroundColor = [UIColor yellowColor];//这里面有尺寸信息和内容
    return cell;
    //    UITableView *tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30) style:UITableViewStylePlain];
    //    return tableView1;
}
#pragma mark -设置headerView方法
//-(void)setHeaderView{
//    _headerView = [yyImageView ];
//    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeaderView:)];
//    [recognizer setNumberOfTapsRequired:1];
//    [_headerView addGestureRecognizer:recognizer];
//}
-(void)clickHeaderView:(UITapGestureRecognizer *)recgonizer{
    yyHeaderView *headerView = recgonizer.view;
    headerView.selected = !headerView.selected;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:headerView.tag]  withRowAnimation:UITableViewRowAnimationNone];
}
#pragma mark -返回 yyHeroCell高度方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    yyHeroFrame *heroFrame = self.heroesFrame[indexPath.row];
    //    return heroFrame.cellHeight;
    return 30;
}
#pragma mark -返回headerView方法
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    yyHeaderView *headerView = self.headerArray[section];
    return headerView;
}
#pragma mark -返回headerView高度方法
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    yyHeaderView *headerView = self.headerArray[section];
    return headerView.headerViewFrame.cellHeight;
}
#pragma mark 两个控件设置布局
-(void)setConstraints{
    //设置segmentView
    [self setContratintsForsegmentView:self.segmentView];
    //设置heroView
    [self setContratintsForHeroView:self.heroView];
    //设置tableView
    [self setContratintsForTableView:self.tableView];
    //设置secondView
    [self setConstraitsForSecondView];
}
-(void)setContratintsForsegmentView:(yysegment *)segmentView{
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        //make.centerX.equalTo(self.view.mas_centerX);
        float gap = [UIScreen mainScreen].bounds.size.width * 0.2;
        make.left.equalTo(self.view.mas_left).offset(gap);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.1);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.6);
    }];
    NSLog(@"%s",__func__);
}
#pragma mark tableView布局
/*
 左、右，底部与self.view贴合
 高度为self.view.height的0.6倍
 */
-(void)setContratintsForTableView:(UITableView *)tableView{
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.6);
    }];
}
#pragma mark heroView布局
/*
 宽度和高度一致为self.view.height的0.2倍
 中心与屏幕中心对齐
 顶部与屏幕对齐
 */
-(void)setContratintsForHeroView:(yyHeroView*) heroView{
    //直接出去
    [heroView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_height).multipliedBy(0.2);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.2);
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(80);
    }];
}

//-(void)setConstraitsForFirstView{
//    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.segmentView.mas_bottom);
//        make.width.equalTo(self.view.mas_width);
//        make.bottom.equalTo(self.view.mas_bottom);
//    }];
//}
-(void)setConstraitsForSecondView{
    [self.secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom);
        make.width.equalTo(self.view.mas_width);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}
- (BOOL) prefersStatusBarHidden
{
    return YES;
}
#pragma mark--监听点击方法，展开一个tablview
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 15;
}
//怎么样实现整体有94个，而每个下面只有一个
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    yyHeaderView *headerView = self.headerArray[section];
    if (headerView.selected) {
        return 1;
    }else{
        return 0;
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 10;//设置你footer高度
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}
-(void)clickSegment{
    if (self.segmentView.segmentView.selectedSegmentIndex == 0) {
        self.secondView.hidden = YES;
        self.view.hidden = NO;
    }else{
        self.secondView.hidden = NO;
    }
}
@end
