//
//  Article.m
//  ganHuo1
//
//  Created by bytedance on 2021/11/2.
//

#import "StoriesModel.h"


@interface StoriesModel ()
@end

@implementation StoriesModel
-(instancetype)initWithJSON:(NSObject *)obj {
    self = [StoriesModel new];
    return self;
}
+(id) StoriesModelWithDict:(NSObject *)obj{
    return [[self alloc]initWithJSON:obj];
}
@end
