//
//  DatilCell.h
//  ganHuo1
//
//  Created by bytedance on 2021/11/2.
//

#import <UIKit/UIKit.h>
#import "StoriesModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface DatilCell : UITableViewCell
@property(nonatomic,strong) StoriesModel *story;
@property(nonatomic,weak) UILabel *titleView;
@property(nonatomic,weak) UIImageView *imgView;
@property(nonatomic,weak) UILabel *hintView;

@end

NS_ASSUME_NONNULL_END
