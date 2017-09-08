//
//  HXPictureTextMixingView.m
//  HXPictureTextMixing
//
//  Created by 黄轩 on 2017/9/6.
//  Copyright © 2017年 IT小子. All rights reserved.
//

#import "HXPictureTextMixingView.h"

@implementation HXPictureTextMixingView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (void)setup {    
    // 创建label
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _contentLabel.backgroundColor = [UIColor clearColor];
    _contentLabel.numberOfLines = 0;
    [self addSubview:_contentLabel];
    
    _tagView = [[UIView alloc] initWithFrame:CGRectZero];
    _tagView.backgroundColor = [UIColor clearColor];
    [self addSubview:_tagView];
}

- (void)setData:(id)data {

    if ([data isKindOfClass:[HXPictureTextMixingViewModel class]]) {
        HXPictureTextMixingViewModel *model = (HXPictureTextMixingViewModel *)data;
        
        //计算一个单位空格的长度
        CGSize spaceSize = [HXPictureTextMixingView sizeWithContent:@" " font:[UIFont systemFontOfSize:model.tagSize.height] constrainedToMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
        
        //计算标签宽度需要多少个空格填充
        int count = (model.tagSize.width + model.space) / spaceSize.width + .5;
        
        NSString *spaceStr = @"";
        for (int i = 0;i < count; i++) {
            spaceStr = [spaceStr stringByAppendingString:@" "];
        }

        _contentLabel.font = [UIFont systemFontOfSize:model.fontSize];
        
        if (model.locationType == LocationTypeFront) {
            //标签在文字前面 空格加在前面
            _contentLabel.text = [NSString stringWithFormat:@"%@%@",spaceStr,model.content];
        } else {
            //标签在文字后面 空格加在后面
            _contentLabel.text = model.content;
        }
        
        //计算空格+文字占据的size
        CGSize size = [HXPictureTextMixingView sizeWithContent:_contentLabel.text font:[UIFont systemFontOfSize:model.fontSize] constrainedToMaxSize:CGSizeMake(model.width, MAXFLOAT)];
        
        if (model.locationType == LocationTypeFront) {
            //标签在文字前面
            _tagView.frame = CGRectMake(0, 0, model.tagSize.width, model.tagSize.height);
        } else {
            //计算不折行文字的总长度
            CGSize tosize = [HXPictureTextMixingView sizeWithContent:_contentLabel.text font:[UIFont systemFontOfSize:model.fontSize] constrainedToMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
            
            float width = 0;
            
            //计算折行多出来的长度
            if (tosize.width > size.width) {
                //超出一行
                width = (int)tosize.width % (int)size.width;
            } else {
                //不足一行
                width = tosize.width;
            }
            
            if (width + model.space + model.tagSize.width > model.width) {
                //多出来的不是空格
                _tagView.frame = CGRectMake(0, self.frame.size.height - model.tagSize.height - 2, model.tagSize.width, model.tagSize.height);
            } else {
                float botton = model.tagSize.height - model.fontSize;
                _tagView.frame = CGRectMake(width + 10, self.frame.size.height - model.tagSize.height - 1 + botton/2, model.tagSize.width, model.tagSize.height);
            }
        }
        _contentLabel.frame = CGRectMake(0, 0, size.width, size.height);
    }
}

//计算文字的Size
+ (CGSize)sizeWithContent:(NSString *)content font:(UIFont *)font constrainedToMaxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName:font};
    //计算文字占据的Size
    CGSize size = [content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size;
}

//获取高度
+ (CGFloat)getHeightWithModel:(HXPictureTextMixingViewModel *)model {
    //计算一个单位空格的长度
    CGSize spaceSize = [HXPictureTextMixingView sizeWithContent:@" " font:[UIFont systemFontOfSize:model.tagSize.height] constrainedToMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    //计算标签宽度需要多少个空格填充
    int count = (model.tagSize.width + model.space) / spaceSize.width + .5;
    
    NSString *spaceStr = @"";
    for (int i = 0;i < count; i++) {
        spaceStr = [spaceStr stringByAppendingString:@" "];
    }
    
    NSString *coutent = @"";
    CGSize size;
    if (model.locationType == LocationTypeFront) {
        //标签在文字前面 空格加在前面
        coutent = [NSString stringWithFormat:@"%@%@",spaceStr,model.content];
        //计算空格+文字占据的size
        size = [HXPictureTextMixingView sizeWithContent:coutent font:[UIFont systemFontOfSize:model.fontSize] constrainedToMaxSize:CGSizeMake(model.width, MAXFLOAT)];
        return size.height;
    } else {
        //标签在文字后面 空格加在后面
        coutent = model.content;
        //计算空格+文字占据的size
        size = [HXPictureTextMixingView sizeWithContent:coutent font:[UIFont systemFontOfSize:model.fontSize] constrainedToMaxSize:CGSizeMake(model.width, MAXFLOAT)];
        
        //计算不折行文字的总长度
        CGSize tosize = [HXPictureTextMixingView sizeWithContent:coutent font:[UIFont systemFontOfSize:model.fontSize] constrainedToMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
        
        float width = 0;
        
        //计算折行多出来的长度
        if (tosize.width > size.width) {
            //超出一行
            width = (int)tosize.width % (int)size.width;
        } else {
            //不足一行
            width = tosize.width;
        }
        
        if (width + model.space + model.tagSize.width > model.width) {
            return size.height + model.tagSize.height + 4;
        } else {
            return size.height;
        }
    }
}

@end



#pragma mark - Model

@implementation HXPictureTextMixingViewModel

+ (HXPictureTextMixingViewModel *)ittemModelWithContent:(NSString *)content fontSize:(CGFloat)fontSize locationType:(LocationType)locationType tagSize:(CGSize)tagSize space:(CGFloat)space width:(CGFloat)width {
    HXPictureTextMixingViewModel *model = [HXPictureTextMixingViewModel new];
    model.content = content.length > 0 ? content : @"";
    model.locationType = locationType;
    model.fontSize = fontSize;
    model.tagSize = tagSize;
    model.space = space;
    model.width = width;
    return model;
}

@end
