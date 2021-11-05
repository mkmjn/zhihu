//
//  Article.h
//  ganHuo1
//
//  Created by bytedance on 2021/11/2.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface StoriesModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *hint;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSURL *url;
@property (nonatomic, assign) NSUInteger storyId;
@property (nonatomic, copy) NSURL *images;


-(instancetype)initWithJSON:(NSObject *)json;
+(id) StoriesModelWithDict:(NSObject *)json;
@end

NS_ASSUME_NONNULL_END
