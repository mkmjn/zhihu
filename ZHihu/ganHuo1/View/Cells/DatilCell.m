//
//  DatilCell.m
//  ganHuo1
//
//  Created by bytedance on 2021/11/2.
//

#import "DatilCell.h"

@interface DatilCell ()
@property(nonatomic,readwrite) CGRect tableSize1;
@end


@implementation DatilCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil]) {
        UILabel *titleView = [[UILabel alloc]init];
        titleView.numberOfLines = 0;
        _titleView = titleView;
       
        [self.contentView addSubview:titleView];
        UIImageView *imageView = [[UIImageView alloc]init];
        _imgView = imageView;
        [self.contentView addSubview:imageView];
        UILabel *hintView = [[UILabel alloc] init];
        hintView.font = [UIFont systemFontOfSize:14];
        hintView.numberOfLines = 0;
        _hintView = hintView;
        [self.contentView addSubview:hintView];
      
    }
    return self;
}
- (void)setStory:(StoriesModel *)story{
    _story = story;
    [self settingData];
}
- (void)layoutSubviews{
    CGFloat padding = 10;
    CGFloat titleX = padding;
    CGFloat titleT = padding;
    
    CGFloat titleW = (((CGFloat)self.bounds.size.width)*3)/5;

    CGFloat titleH = ((CGFloat)self.bounds.size.width)/5;
    _titleView.frame = CGRectMake(titleX, titleT, titleW, titleH);
    
    CGFloat imgX = (((CGFloat)self.bounds.size.width)*3)/5 +padding;
    CGFloat imgY = padding;
    CGFloat imgW = (CGFloat) self.bounds.size.width;
    CGFloat imgH = 130;
    _imgView.frame =  CGRectMake(imgX, imgY, imgW, imgH);
    CGFloat hintX = padding;
    CGFloat hintY = CGRectGetMaxY(_titleView.frame) + 2*padding;
    CGFloat hintW = (((CGFloat) self.bounds.size.width)*3)/5 ;
    CGFloat hintH = ((CGFloat) self.bounds.size.width)/10;
    _hintView.frame = CGRectMake(hintX, hintY, hintW, hintH);
}

-(void) settingData{
    _titleView.text = _story.title;
    NSData *data = [NSData dataWithContentsOfURL:_story.images];
    _imgView.image = [UIImage imageWithData:data];
    _hintView.text = _story.hint;
}
@end
