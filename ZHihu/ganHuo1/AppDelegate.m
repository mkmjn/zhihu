//
//  AppDelegate.m
//  ganHuo1
//
//  Created by bytedance on 2021/11/2.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ZHMoviePlayerController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    ZHMoviePlayerController *ZHVC = [[ZHMoviePlayerController alloc]init];
        
 // 加载本地图片
    [ZHVC setImageInIndexWithURL:YES timeCount:4];
    self.window.rootViewController = ZHVC;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
