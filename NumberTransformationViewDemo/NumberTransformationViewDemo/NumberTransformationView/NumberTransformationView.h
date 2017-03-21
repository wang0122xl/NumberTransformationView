//
//  NumberTransformationView.h
//  NumberTransformationViewDemo
//
//  Created by mac on 17/3/21.
//  Copyright © 2017年 jason.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberTransformationView : UIView

- (instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font;

@property (nonatomic, copy) NSNumber *numberValue;

@property (nonatomic , strong) UIFont *font;

@property (nonatomic , strong) UIColor *textColor;

@property (nonatomic , assign) NSTextAlignment alignment;

@property (nonatomic , assign) CGFloat textMargin;

@property (nonatomic , assign) UIEdgeInsets contentEdgeInsets;

@end
