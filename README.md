# HXPictureTextMixingView 如果对你有一点点帮助,请给一颗★,你的支持是对我的最大鼓励！推荐工具 iOS打包机器人 https://github.com/huangxuan518/HXPackRobot
HXPictureTextMixingView是一款图文混排的View

特性： 

-图片在文字前面 

-图片在文字后面

-支持单行 多行显示 

-支持高度计算方法+ (CGFloat)getHeightWithModel:(HXPictureTextMixingViewModel *)model;

# 效果展示

![image](https://github.com/huangxuan518/HXPictureTextMixing/blob/master/HXPictureTextMixing/1.png)
![image](https://github.com/huangxuan518/HXPictureTextMixing/blob/master/HXPictureTextMixing/2.png)
![image](https://github.com/huangxuan518/HXPictureTextMixing/blob/master/HXPictureTextMixing/3.png)

# 适用
本标签类适用于单图片(View) + 文字(UILabel)组合并且多行显示的需求

# View上使用HXPictureTextMixingView示例

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

#高度计算方法

//View高度
+ (CGFloat)getHeightWithModel:(HXPictureTextMixingViewModel *)model;
    
# 博客交流
 http://blog.libuqing.com/
