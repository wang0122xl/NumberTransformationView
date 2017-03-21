//
//  TextTransformationLayer.m
//  NumberTransformationViewDemo
//
//  Created by mac on 17/3/21.
//  Copyright © 2017年 jason.wang. All rights reserved.
//

#import "TextTransformationLayer.h"

@interface TextTransformationLayer ()
{
    NSArray <NSString *>* _textArr;
    
    NSMutableArray *_labels;
}

@end

@implementation TextTransformationLayer

- (void)setTextArray:(NSArray<NSString *> *)textArr font:(UIFont *)font textColor:(UIColor *)textColor selectText:(NSString *)selectText {
    _textArr = textArr;
    if (!_labels) {
        _labels = [NSMutableArray array];
    }
    for (UILabel *label in _labels) {
        [label.layer removeFromSuperlayer];
    }
    
    for (NSString *text in textArr) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height * [textArr indexOfObject:text], self.bounds.size.width, self.bounds.size.height)];
        label.font = font;
        label.text = text;
        label.textColor = textColor;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSublayer:label.layer];
        [_labels addObject:label];
    }
    
    self.selectText = selectText;
}

- (void)setSelectText:(NSString *)selectText {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"sublayerTransform.translation.y"];
    anim.duration = 0.5;
    
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.fromValue = @(-self.bounds.size.height * [_textArr indexOfObject:_selectText ? _selectText : _textArr[0]]);
    anim.toValue = @(-self.bounds.size.height * [_textArr indexOfObject:selectText]);

    [self addAnimation:anim forKey:@"animation"];

    _selectText = selectText;
}


@end
