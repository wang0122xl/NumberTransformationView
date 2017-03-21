//
//  NumberTransformationView.m
//  NumberTransformationViewDemo
//
//  Created by mac on 17/3/21.
//  Copyright © 2017年 jason.wang. All rights reserved.
//

#import "NumberTransformationView.h"
#import "TextTransformationLayer.h"

@interface NumberTransformationView ()
{
    NSMutableArray<TextTransformationLayer *> *_scrollLayers;
}

@end

@implementation NumberTransformationView
CGFloat kAnimationNumberLabel_eachWidth;


- (instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font {
    if (self = [super initWithFrame:frame]) {
        _font = font;
        _scrollLayers = [NSMutableArray array];
        _textMargin = 0;
        self.layer.masksToBounds = YES;
        kAnimationNumberLabel_eachWidth = [@"O" boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, frame.size.height) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.width;
    }
    return self;
}

- (void)setNumberValue:(NSNumber *)numberValue {
    [self configScrollLayers:numberValue];
    _numberValue = numberValue;
}

- (void)configScrollLayers:(NSNumber *)numberValue {
    CGFloat lastX = 0;
    if (_alignment == NSTextAlignmentRight) {
        lastX = self.frame.size.width - kAnimationNumberLabel_eachWidth - _contentEdgeInsets.right;
    } else if (_alignment == NSTextAlignmentLeft) {
        lastX = (kAnimationNumberLabel_eachWidth + _textMargin) * (numberValue.description.length - 1) + _contentEdgeInsets.left;
    } else if (_alignment == NSTextAlignmentCenter) {
        lastX = self.frame.size.width / 2.0 + (kAnimationNumberLabel_eachWidth * numberValue.description.length + _textMargin * (numberValue.description.length - 1)) / 2.0 - kAnimationNumberLabel_eachWidth;
    }
    
    for (NSInteger i = numberValue.description.length; i<_scrollLayers.count; i++) {
        [_scrollLayers[i] removeFromSuperlayer];
        [_scrollLayers removeObjectAtIndex:i];
        i--;
    }
    
    for (NSInteger i = _scrollLayers.count; i<numberValue.description.length; i++) {
        TextTransformationLayer *textLayer = [TextTransformationLayer layer];
        textLayer.frame = CGRectMake(lastX - i * kAnimationNumberLabel_eachWidth, 0, kAnimationNumberLabel_eachWidth, self.bounds.size.height);
       
        [textLayer setTextArray:@[@".",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"] font:_font textColor:_textColor selectText:@"0"];
        [_scrollLayers addObject:textLayer];
        
        [self.layer addSublayer:textLayer];
        
    }
    
    for (NSInteger i = 0; i<_scrollLayers.count; i++) {
        TextTransformationLayer *layer = _scrollLayers[i];
        layer.frame = CGRectMake(lastX - i * kAnimationNumberLabel_eachWidth - _textMargin * i, 0, kAnimationNumberLabel_eachWidth, self.bounds.size.height);
        layer.selectText = [numberValue.description substringWithRange:NSMakeRange(_scrollLayers.count - i - 1, 1)];
    }
}

@end
