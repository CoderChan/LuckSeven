//
//  YoungSphere.h
//  YoungTag
//
//  Created by youngstar on 2017/5/23.
//  Copyright © 2017年 Young. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface YoungSphere : UIView

/**
 *  Sets the cloud's tag views.
 *
 *	@remarks Any @c UIView subview can be passed in the array.
 *
 *  @param array The array of tag views.
 */
- (void)setCloudTags:(NSArray <UIImageView *>*)array;

/**
 *  Starts the cloud autorotation animation.
 */
- (void)timerStart;

/// 自动旋转
- (void)autoTurnRotation;

/**
 *  Stops the cloud autorotation animation.
 */
- (void)timerStop;

@property (nonatomic, copy) void (^finishBlock)(void);

@end
