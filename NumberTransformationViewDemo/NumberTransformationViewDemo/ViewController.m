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

- (NumberTransformationView *)transformationViewWithFrame:(CGRect)frame {
    NumberTransformationView *view = [[NumberTransformationView alloc] initWithFrame:frame font:[UIFont systemFontOfSize:18]];
    view.layer.borderColor = [UIColor colorWithRed:170 / 255.0 green:170 / 255.0 blue:170 / 255.0 alpha:1].CGColor;
    view.layer.borderWidth = 1;
    view.layer.cornerRadius = 5;
    return view;
}

- (void)configAddView {
    _addView = [self transformationViewWithFrame:CGRectMake(CGRectGetMaxX(_addButton.frame) + 80, _addButton.frame.origin.y + 5, 150, _addButton.frame.size.height-10)];
    
    _addView.alignment = NSTextAlignmentCenter;
    _addView.textMargin = 10;
    _addView.numberValue = @(1);
    _addView.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    [self.view addSubview:_addView];
}

- (void)configSubtractView {
    _subtractView = [self transformationViewWithFrame:CGRectMake(CGRectGetMaxX(_subtractBtn.frame) + 80, _subtractBtn.frame.origin.y + 5, 150, _subtractBtn.frame.size.height - 10)];
    _subtractView.alignment = NSTextAlignmentCenter;
    _addView.textMargin = -2;
    _subtractView.numberValue = @(100);
    _subtractView.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15);
    [self.view addSubview:_subtractView];
}

- (void)configRandomView {
    _randomView = [self transformationViewWithFrame:CGRectMake(CGRectGetMaxX(_randomBtn.frame) + 80, _randomBtn.frame.origin.y + 5, 150, _randomBtn.frame.size.height - 10)];
    _randomView.alignment = NSTextAlignmentCenter;
    _randomView.numberValue = @(99);
    _randomView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
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

- (IBAction)changeAlignment:(id)sender {
    NSTextAlignment aligment;
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            aligment = NSTextAlignmentLeft;
            break;
        case 1:
            aligment = NSTextAlignmentCenter;
            break;
        case 2:
            aligment = NSTextAlignmentRight;
            break;
            
        default:
            break;
    }
    
    
    _addView.alignment = aligment;
    _subtractView.alignment = aligment;
    _randomView.alignment = aligment;
}


@end
