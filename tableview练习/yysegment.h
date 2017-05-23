//
//  yysegment.h
//  tableview练习
//
//  Created by 俞益 on 2017/5/17.
//  Copyright © 2017年 俞益. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface yysegment : UIView
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentView;

@property (strong, nonatomic) IBOutlet UIView *bottomView;
+(instancetype)segment;
@end
