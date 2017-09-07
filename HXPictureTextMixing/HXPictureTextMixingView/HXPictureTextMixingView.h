//
//  HXPictureTextMixingView.h
//  HXPictureTextMixing
//
//  Created by 黄轩 on 2017/9/6.
//  Copyright © 2017年 IT小子. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HXPictureTextMixingViewModel;

typedef NS_ENUM(NSInteger, LocationType) {
    LocationTypeFront = 0,//前
    LocationTypeBack//后
};

@interface HXPictureTextMixingView : UIView

@property (nonatomic,strong) UIView *tagView;//标签 可以添加UILabel UIView UIImageView等
@property (nonatomic,strong) UILabel *contentLabel;//内容Label

- (void)setData:(id)data;

+ (CGFloat)getHeightWithModel:(HXPictureTextMixingViewModel *)model;

@end


#pragma mark - model

@interface HXPictureTextMixingViewModel : NSObject

@property (nonatomic,copy) NSString *content;//内容
@property (nonatomic,assign) CGFloat fontSize;//内容的文字大小
@property (nonatomic,assign) LocationType locationType;//标签图标是在文字前面还是后面
@property (nonatomic,assign) CGSize tagSize;//标签的尺寸
@property (nonatomic,assign) CGFloat space;//标签和文字间隔
@property (nonatomic,assign) CGFloat width;//view的宽度

+ (HXPictureTextMixingViewModel *)ittemModelWithContent:(NSString *)content fontSize:(CGFloat)fontSize locationType:(LocationType)locationType tagSize:(CGSize)tagSize space:(CGFloat)space width:(CGFloat)width;

@end
