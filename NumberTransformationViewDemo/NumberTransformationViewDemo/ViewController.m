//
//  ViewController.m
//  NumberTransformationViewDemo
//
//  Created by mac on 17/3/21.
//  Copyright © 2017年 jason.wang. All rights reserved.
//

#import "ViewController.h"
#import "NumberTransformationView.h"
#import "TextTransformationLayer.h"

@interface ViewController ()
{
    NumberTransformationView *_addView;
    NumberTransformationView *_subtractView;
    NumberTransformationView *_randomView;
    
}
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *subtractBtn;
@property (weak, nonatomic) IBOutlet UIButton *randomBtn;
@property (weak, nonatomic) IBOutlet UIButton *aligmentLeftBtn;
@property (weak, nonatomic) IBOutlet UIButton *aligmentRightBtn;
@property (weak, nonatomic) IBOutlet UIButton *aligmentCenterBtn;

@property (nonatomic , strong) NSTimer *addTimer;
@property (nonatomic , strong) NSTimer *subtractTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configAddView];
    [self configSubtractView];
    [self configRandomView];
}

- (void)configAddView {
    _addView = [[NumberTransformationView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_addButton.frame) + 80, _addButton.frame.origin.y + 5, 150, _addButton.frame.size.height-10) font:[UIFont systemFontOfSize:18]];
    _addView.alignment = NSTextAlignmentCenter;
    _addView.layer.cornerRadius = 5;
    _addView.textMargin = 15;
    _addView.layer.borderColor = [UIColor colorWithRed:170 / 255.0 green:170 / 255.0 blue:170 / 255.0 alpha:1].CGColor;
    _addView.layer.borderWidth = 1;
    _addView.numberValue = @(1);
    _addView.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    [self.view addSubview:_addView];
}

- (void)configSubtractView {
    _subtractView = [[NumberTransformationView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_subtractBtn.frame) + 80, _subtractBtn.frame.origin.y + 5, 150, _subtractBtn.frame.size.height - 10) font:[UIFont systemFontOfSize:18]];
    _subtractView.alignment = NSTextAlignmentCenter;
    _subtractView.layer.cornerRadius = 5;
    _subtractView.layer.borderColor = [UIColor colorWithRed:170 / 255.0 green:170 / 255.0 blue:170 / 255.0 alpha:1].CGColor;
    _subtractView.layer.borderWidth = 1;
    _subtractView.numberValue = @(100);
    _subtractView.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15);
    [self.view addSubview:_subtractView];
}

- (void)configRandomView {
    _randomView = [[NumberTransformationView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_randomBtn.frame) + 80, _randomBtn.frame.origin.y + 5, 150, _randomBtn.frame.size.height - 10) font:[UIFont systemFontOfSize:18]];
    _randomView.alignment = NSTextAlignmentCenter;
    _randomView.layer.cornerRadius = 5;
    _randomView.layer.borderColor = [UIColor colorWithRed:170 / 255.0 green:170 / 255.0 blue:170 / 255.0 alpha:1].CGColor;
    _randomView.layer.borderWidth = 1;
    _randomView.numberValue = @(99);
    [self.view addSubview:_randomView];
}

#pragma mark - getter
- (NSTimer *)addTimer {
    if (_addTimer) {
        return _addTimer;
    }
    _addTimer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        _addView.numberValue = @(_addView.numberValue.integerValue + 1);
    }];
    return _addTimer;
}

- (NSTimer *)subtractTimer {
    if (_subtractTimer) {
        return _subtractTimer;
    }
    _subtractTimer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        _subtractView.numberValue = @(_subtractView.numberValue.integerValue - 1);
    }];
    return _subtractTimer;
}

#pragma mark - actions

- (IBAction)startAdding:(id)sender {
    [self.addTimer fire];
}

- (IBAction)startSubtracting:(id)sender {
    [self.subtractTimer fire];
}

- (IBAction)startRandoming:(id)sender {
    double front = pow(10, arc4random()%4) * (arc4random()%9 + 1) + arc4random()%9 + 1;
    double back = (arc4random()%99 + 1) / 100.0;
    NSString *numberString = [NSString stringWithFormat:@"%.2f",front + back];
    _randomView.numberValue = @(numberString.floatValue);
}

- (IBAction)changeToAligmentLeft:(id)sender {
    _addView.alignment = NSTextAlignmentLeft;
    _subtractView.alignment = NSTextAlignmentLeft;
    _randomView.alignment = NSTextAlignmentLeft;
}

- (IBAction)changeToAligmentRight:(id)sender {
    _addView.alignment = NSTextAlignmentRight;
    _subtractView.alignment = NSTextAlignmentRight;
    _randomView.alignment = NSTextAlignmentRight;
}

- (IBAction)changeToAligmentCenter:(id)sender {
    _addView.alignment = NSTextAlignmentCenter;
    _subtractView.alignment = NSTextAlignmentCenter;
    _randomView.alignment = NSTextAlignmentCenter;
}


@end
