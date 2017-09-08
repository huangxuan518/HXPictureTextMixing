//
//  HXViewController.m
//  HXTagsView https://github.com/huangxuan518/HXTagsView
//  博客地址 http://blog.libuqing.com/
//  Created by 黄轩 on 16/1/14.
//  Copyright © 2016年 IT小子. All rights reserved.
//

#import "HXViewController.h"
#import "HXPictureTextMixingView.h"

@interface HXViewController ()

@end

@implementation HXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    //标签
    UILabel *tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 14)];
    tagLabel.font = [UIFont systemFontOfSize:12];
    tagLabel.textColor = [UIColor orangeColor];
    tagLabel.textAlignment = NSTextAlignmentCenter;
    tagLabel.layer.borderWidth = 1.0;
    tagLabel.layer.borderColor = [UIColor orangeColor].CGColor;
    tagLabel.layer.cornerRadius = tagLabel.frame.size.height / 2;
    tagLabel.layer.masksToBounds = YES;
    tagLabel.text = @"测试标签";
    
    //图文混排数据模型
    HXPictureTextMixingViewModel *model = [HXPictureTextMixingViewModel ittemModelWithContent:@"蛮荒记蛮荒记蛮荒记蛮荒记蛮荒记蛮荒记蛮荒记蛮荒记蛮荒记蛮荒记蛮荒记蛮荒记蛮荒记荒记蛮荒记蛮荒记蛮荒" fontSize:15 locationType:LocationTypeBack tagSize:tagLabel.frame.size space:10 width:[UIScreen mainScreen].bounds.size.width - 20];
    //高度计算
    float height = [HXPictureTextMixingView getHeightWithModel:model];
    //图文混排View
    HXPictureTextMixingView *pictureTextMixingView = [[HXPictureTextMixingView alloc] initWithFrame:CGRectMake(10, 100, model.width, height)];
    pictureTextMixingView.backgroundColor = [UIColor whiteColor];
    [pictureTextMixingView.tagView addSubview:tagLabel];
    pictureTextMixingView.contentLabel.textColor = [UIColor blueColor];
    [pictureTextMixingView setData:model];
    [self.view addSubview:pictureTextMixingView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
