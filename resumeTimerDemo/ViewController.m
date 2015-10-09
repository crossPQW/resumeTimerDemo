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

@property (nonatomic, strong) NSTimer *unAnswerDoctTimer;

@property (nonatomic, assign) NSInteger unAnswerTime;

@property (nonatomic, strong) UIAlertController *ac;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    
    if (_unAnswerDoctTimer) {
        [_unAnswerDoctTimer invalidate];
        _unAnswerDoctTimer = nil;
        [_unAnswerDoctTimer setFireDate:[NSDate distantFuture]];
    }
    
    self.unAnswerTime = 0;
    _unAnswerDoctTimer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(handleTimeEvents) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_unAnswerDoctTimer forMode:NSRunLoopCommonModes];
    
}

- (void)handleTimeEvents
{
    self.unAnswerTime ++;
    self.timeLabel.text = [NSString stringWithFormat:@"%ld",(long)self.unAnswerTime];
    
    if (self.unAnswerTime == 10) {//
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"150秒咯" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
        self.ac = ac;
        [ac addAction:action];
        [self presentViewController:ac animated:YES completion:nil];
        
        
    }else if (self.unAnswerTime == 20){//
        self.unAnswerTime = 0;
        [self.unAnswerDoctTimer setFireDate:[NSDate distantPast]];
        [self.ac dismissViewControllerAnimated:YES completion:nil];
        [self.unAnswerDoctTimer invalidate];
        self.unAnswerDoctTimer = nil;
    }
}

/**
 *  重启定时器
 */
- (void)resumeTime
{
    self.unAnswerTime = 0;
    [self.unAnswerDoctTimer setFireDate:[NSDate distantPast]];
}
@end
