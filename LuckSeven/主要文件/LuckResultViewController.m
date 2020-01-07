//
//  LuckResultView.m
//  LuckSeven
//
//  Created by sks on 2020/1/6.
//  Copyright © 2020 LuckSeven. All rights reserved.
//

#import "LuckResultViewController.h"
#import <Masonry/Masonry.h>
#import <YYKit/YYKit.h>

@interface LuckResultViewController ()

@property (nonatomic) UIVisualEffectView *effectView;

@property (nonatomic, copy) NSString *iconName;

@property (nonatomic) UIImageView *headView;

@property (nonatomic) UILabel *nameLabel;

@property (nonatomic) UIImageView *roopView;

@property (nonatomic) UIImageView *zhongjiangView;

@property (nonatomic) UIButton *returnButton;

@end

@implementation LuckResultViewController

- (instancetype)initWithIconName:(NSString *)iconName {
    self = [super init];
    if (self) {
        self.iconName = iconName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBar.hidden = YES;
    [self setupSubViews];
}

- (void)setupSubViews {
    [self.view addSubview:self.effectView];
    [self.view addSubview:self.roopView];
    [self.roopView startAnimating];
    self.headView.image = [UIImage imageNamed:self.iconName];
    self.nameLabel.text = self.iconName;
    self.zhongjiangView.image = [UIImage imageNamed:@"zhongjiangla"];
    [self.view addSubview:self.returnButton];
}

- (UIImageView *)roopView {
    NSMutableArray <UIImage *>*roopArray = [NSMutableArray array];
    for (int i = 0; i < 16; i++) {
        NSString *indexStr = i >= 10 ? [NSString stringWithFormat:@"%@",@(i)] : [NSString stringWithFormat:@"0%@",@(i)];
        NSString *name = [NSString stringWithFormat:@"finish_loop_%@",indexStr];
        NSLog(@"图片名 = %@",name);
        UIImage *image = [UIImage imageNamed:name];
        [roopArray addObject:image];
    }
    if (!_roopView) {
        CGFloat size = self.view.frame.size.width;
        _roopView = [[UIImageView alloc]initWithFrame:CGRectMake(0, (self.view.frame.size.height - size) / 2 - 100, size, size)];
        _roopView.animationImages = roopArray;
        _roopView.animationRepeatCount = 0;
        _roopView.animationDuration = 0.8;
    }
    return _roopView;
}

- (UIImageView *)headView {
    if (!_headView) {
        _headView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _headView.contentMode = UIViewContentModeScaleAspectFill;
        [_headView setContentScaleFactor:[UIScreen mainScreen].scale];
        _headView.layer.masksToBounds = YES;
        _headView.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
        _headView.layer.cornerRadius = 80.f;
        _headView.layer.borderColor = [UIColor whiteColor].CGColor;
        _headView.layer.borderWidth = 4;
        [self.view addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.roopView.mas_centerX);
            make.centerY.equalTo(self.roopView.mas_centerY);
            make.size.equalTo(@160);
        }];
    }
    return _headView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont boldSystemFontOfSize:25];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.headView.mas_centerX);
            make.top.equalTo(self.headView.mas_bottom).offset(20);
            make.width.equalTo(@100);
            make.height.equalTo(@30);
        }];
    }
    return _nameLabel;
}

- (UIImageView *)zhongjiangView {
    if (!_zhongjiangView) {
        _zhongjiangView = [[UIImageView alloc]init];
        [self.view addSubview:_zhongjiangView];
        [_zhongjiangView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.roopView.mas_centerX);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(30);
            make.size.equalTo(@200);
        }];
    }
    return _zhongjiangView;
}

- (UIButton *)returnButton {
    if (!_returnButton) {
        UIImage *image = [UIImage imageNamed:@"return_btn"];
        _returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnButton setBackgroundImage:image forState:UIControlStateNormal];
        [_returnButton setBackgroundImage:image forState:UIControlStateHighlighted];
        _returnButton.frame = CGRectMake((self.view.width - 100) / 2, self.view.height - 50 - 40, 100, 50);
        __weak __block typeof(self) weakSelf = self;
        [_returnButton addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            [weakSelf.roopView stopAnimating];
            [weakSelf.navigationController dismissViewControllerAnimated:NO completion:nil];
        }];
    }
    return _returnButton;
}

- (UIVisualEffectView *)effectView {
    if (!_effectView) {
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _effectView = [[UIVisualEffectView alloc]initWithEffect:effect];
        _effectView.frame = self.view.bounds;
    }
    return _effectView;
}

@end
