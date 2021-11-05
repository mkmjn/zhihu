//
//  ViewController.h
//  ganHuo1
//
//  Created by bytedance on 2021/11/2.
//

#import <UIKit/UIKit.h>
#import "StoriesModel.h"


@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLSessionTaskDelegate>
@property (strong, nonatomic) id<UITableViewDataSource> dataSource;
@end

