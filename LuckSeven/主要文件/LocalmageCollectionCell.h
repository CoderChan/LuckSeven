//
//  LocalmageCollectionCell.h
//  LuckSeven
//
//  Created by Chan_Sir on 2020/1/1.
//  Copyright © 2020 LuckSeven. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// RGBA
#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(rgbValue & 0x0000FF))/255.0 alpha:alphaValue]
// RGB
#define RGBACOLOR(R,G,B,A) [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:(A)]
// 随机颜色
#define HWRandomColor RGBACOLOR(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256),1)


@interface LocalmageCollectionCell : UICollectionViewCell

@property (nonatomic) UIImageView *coverImgView;

@property (nonatomic) UILabel *titleLabel;

+ (CGFloat)space;

+ (CGSize)cellSize;

@property (copy,nonatomic) NSString *imageNameStr;

@property (copy,nonatomic) NSString *name;

+ (instancetype)sharedCell:(UICollectionView *)collectView IndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
