//
//  StoryArticle.m
//  ganHuo1
//
//  Created by bytedance on 2021/11/5.
//

#import "StoryArticle.h"

@implementation StoryArticle
-(instancetype)initWithArticle:(NSDictionary *)json {
    self = [StoryArticle new];
    if (self) {
        self.htmlString = json[@"body"];
        self.cssString = json[@"css"];
        self.images = json[@"images"];
        self.share_url = json[@"share_url"];
    }
    return self;
}
+(id) StoryArticleWithDict:(NSDictionary *)json{
    return [[self alloc]initWithArticle:json];
}
@end
