//
//  WebViewController.m
//  ganHuo1
//
//  Created by bytedance on 2021/11/5.
//

#import "WebViewController.h"

@interface WebViewController ()
@property(nonatomic,readwrite) WKWebView *wwView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
//-(void) reloadJson{
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/news/%lu",_storyFrame.stroiesModel.storyId]];
//
//    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
//    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *connectionError) {
//        NSObject *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        NSArray *stories = ((NSDictionary *) obj)[@"stories"];
//
//    }];
//    [task resume];
//}

@end
