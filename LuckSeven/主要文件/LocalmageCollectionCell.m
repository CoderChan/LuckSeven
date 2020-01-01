//
//  LocalmageCollectionCell.m
//  LuckSeven
//
//  Created by Chan_Sir on 2020/1/1.
//  Copyright © 2020 LuckSeven. All rights reserved.
//

#import "LocalmageCollectionCell.h"
#import <YYKit/YYKit.h>

@interface LocalmageCollectionCell()

@end

@implementation LocalmageCollectionCell

+ (instancetype)sharedCell:(UICollectionView *)collectView IndexPath:(NSIndexPath *)indexPath
{
    LocalmageCollectionCell *cell = [collectView dequeueReusableCellWithReuseIdentifier:@"LocalmageCollectionCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[LocalmageCollectionCell alloc]init];
    }
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubViews];
    }
    return self;
}

- (void)setImageNameStr:(NSString *)imageNameStr {
    _imageNameStr = imageNameStr;
    _titleLabel.text = imageNameStr;
}

- (void)setName:(NSString *)name {
    _name = name;
    _coverImgView.image = [UIImage imageNamed:name];
}

- (void)setupSubViews {
    self.coverImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, LocalmageCollectionCell.cellSize.width, LocalmageCollectionCell.cellSize.height)];
    self.coverImgView.image = [UIImage imageNamed:@"杨玲"];
    self.coverImgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.coverImgView setContentScaleFactor:[UIScreen mainScreen].scale];
    self.coverImgView.layer.masksToBounds = YES;
    self.coverImgView.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
    [self addSubview:self.coverImgView];
    
    
    UIImageView *maskView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mask_bottom_shadow"]];
    maskView.frame = CGRectMake(0, self.coverImgView.height - 50, self.coverImgView.width, 50);
    [self addSubview:maskView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.coverImgView.height - 30, LocalmageCollectionCell.cellSize.width, 30)];
    self.titleLabel.text = @"杨玲";
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
}

+ (CGFloat)space {
    return 1.5;
}

+ (CGSize)cellSize {
    CGFloat space = LocalmageCollectionCell.space;
    CGFloat width = (UIScreen.mainScreen.bounds.size.width + space * 2 - 4 * space) / 3;
    CGSize size = CGSizeMake(width, width / 0.5625);
    return size;
}

@end
