//
//  TextTransformationLayer.h
//  NumberTransformationViewDemo
//
//  Created by mac on 17/3/21.
//  Copyright © 2017年 jason.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextTransformationLayer : CAScrollLayer

- (void)setTextArray:(NSArray<NSString *> *)textArr
                font:(UIFont *)font
           textColor:(UIColor *)textColor
          selectText:(NSString *)selectText;

@property (nonatomic, copy) NSString *selectText;

@end
