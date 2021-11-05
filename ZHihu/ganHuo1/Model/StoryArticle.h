//
//  StoryArticle.h
//  ganHuo1
//
//  Created by bytedance on 2021/11/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StoryArticle : NSObject
@property (copy, nonatomic) NSString *htmlString;
@property (strong, nonatomic) NSString *cssString;
@property (strong, nonatomic) NSString *images;
@property (copy, nonatomic) NSURL *share_url;
@end

NS_ASSUME_NONNULL_END
