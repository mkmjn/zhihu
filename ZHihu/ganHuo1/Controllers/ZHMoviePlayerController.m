//
//  ZHMoviePlayerController.m
//  AppStart
//
//  Created by 张豪 on 2018/4/25.
//  Copyright © 2018年 张豪. All rights reserved.
//
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width


#import "ZHMoviePlayerController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "ViewController.h"

@interface ZHMoviePlayerController ()

@property (nonatomic, strong)UIButton *enterMainButton;
@property (nonatomic, assign) int timeCount;
@property (nonatomic, weak)NSTimer *timer;


@end

@implementation ZHMoviePlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}


- (void)setImageInIndexWithURL:(BOOL)localImageName timeCount:(int)timeCount{
    _timeCount = timeCount;
    UIImageView *imagev1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

    if (localImageName) {
        UIImage *image = [UIImage imageNamed:@"1.png"];
        imagev1.image = image;
    }
    
    [self.view addSubview:imagev1];
    [self createLoginBtn];
}


// 用户不用点击, 几秒后自动进入程序
- (void)createLoginBtn
{
    // 进入按钮
    _enterMainButton = [[UIButton alloc] init];
    _enterMainButton.frame = CGRectMake(SCREEN_WIDTH - 90, 50, 60, 30);
    _enterMainButton.backgroundColor = [UIColor grayColor];
    _enterMainButton.titleLabel.font = [UIFont systemFontOfSize:12];
    _enterMainButton.layer.cornerRadius = 15;
    NSString *title = [NSString stringWithFormat:@"跳过 %d", _timeCount];
    [_enterMainButton setTitle:title forState:UIControlStateNormal];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(DaoJiShi) userInfo:nil repeats:YES];
    [_enterMainButton addTarget:self action:@selector(enterMainAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_enterMainButton];
   
}
// 倒计时
- (void)DaoJiShi{
    if (_timeCount > 0) {
        _timeCount -= 1;
        NSString *title = [NSString stringWithFormat:@"跳过 %d", _timeCount];
        [_enterMainButton setTitle:title forState:UIControlStateNormal];
    }else{
        [_timer invalidate];
        _timer = nil;
        [self enterMainAction];
    }
}

- (void)enterMainAction{
    
    NSLog(@"点击了进入应用按钮");
    ViewController *vc = [[ViewController alloc]init];
    self.view.window.rootViewController = vc;
}
@end
