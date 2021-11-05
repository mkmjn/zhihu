//
//  ViewController.m
//  ganHuo1
//
//  Created by bytedance on 2021/11/2.
//

#import "ViewController.h"
#import "StoriesModel.h"
#import "DatilCell.h"
#import "WebViewController.h"

@interface ViewController ()
@property(nonatomic,readwrite) NSArray *dataArray;
@property(nonatomic,readwrite) NSArray *story;
@property(nonatomic,readwrite) UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   /// self.navigationItem.title = @"知乎日报";
    [self createTableView];
    
    // Do any additional setup after loading the view.
}/*获取数据*/
-(NSArray *) dataArray
{
    if (_dataArray.count == 0) {
        _dataArray = [[NSArray alloc]init];
        [self reloadJson];
        [self inflateStories:_story];
    }
    return _dataArray;
}
-(void) reloadJson{
    NSURL *url = [NSURL URLWithString:@"https://news-at.zhihu.com/api/4/news/latest"];

    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *connectionError) {
        NSObject *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *stories = ((NSDictionary *) obj)[@"stories"];
        NSLog(@"%@",stories);
        self->_story  = stories;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_tableview reloadData];
        });
    }];
    [task resume];
}
//获取数据
- (void)inflateStories:(NSArray *)stories {
    NSMutableArray<StoriesModel *> *storiesModel = [[NSMutableArray alloc] init];

    [stories enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        StoriesModel *story = [StoriesModel StoriesModelWithDict:obj];
        story.title = obj[@"title"];
        story.storyId = [obj[@"id"] unsignedIntegerValue];
        story.images = [NSURL URLWithString:[obj[@"images"] firstObject]];
        story.hint = obj[@"hint"];
        story.url = obj[@"url"];
        [storiesModel addObject:story];
    }];
    _dataArray = storiesModel;
}
-(void) createTableView{
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tableview.dataSource = self;
    tableview.delegate = self;
    _tableview = tableview;
    [self.view addSubview:tableview];
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID = @"story";
    DatilCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[DatilCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.story = self.dataArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    WebViewController *wvc = [[WebViewController alloc] init];
//    self.view.window.rootViewController = wvc;
//    
//  // NSNotification *noti = [NSNotification notificationWithName:@"storyid" object:self];
//    NSNotification *notification = [NSNotification notificationWithName:@"storyid" object:nil userInfo:@{@"storyid": }];
//    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
@end
