//
//  ViewController.m
//  resumeTimerDemo
//
//  Created by 黄少华 on 15/10/9.
//  Copyright © 2015年 黄少华. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSInteger number;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //根据文字内容初始化一个属性字符串
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self.timeLabel.text];
    //给属性字符串设置属性
    [attributeString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, 2)];
    //把属性字符串复制给label
    self.timeLabel.attributedText = attributeString;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(handleTimeEvents) userInfo:nil repeats:YES];
    [self.timer setFireDate:[NSDate distantFuture]];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}


- (IBAction)start:(id)sender {
    [self.timer setFireDate:[NSDate distantPast]];
}


- (IBAction)suspend:(id)sender {
    [self.timer setFireDate:[NSDate distantFuture]];
}

- (IBAction)stop:(id)sender {
    self.number = 0;
}

- (void)handleTimeEvents
{
    self.number++;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%ld",(long)self.number];
    
    NSLog(@"time == %ld",(long)self.number);
}


@end
