//
//  GPViewAnimationViewController.m
//  GPAnimationLearning
//
//  Created by 郭鹏 on 2017/3/31.
//  Copyright © 2017年 郭鹏. All rights reserved.
//

#import "GPViewAnimationViewController.h"

@interface GPViewAnimationViewController ()
// 控件
@property (weak, nonatomic) IBOutlet UIImageView *clound1;
@property (weak, nonatomic) IBOutlet UIImageView *clound2;
@property (weak, nonatomic) IBOutlet UIImageView *clound3;
@property (weak, nonatomic) IBOutlet UIImageView *clound4;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *passcodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
// 控件约束

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tittleCenterYLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *phoneCenterYLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passcodeCenterYLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBtnCenterYLayout;

@end

@implementation GPViewAnimationViewController
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupAnimation];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadAnimation];
}
#pragma mark - 初始化
- (void)setupView
{
    self.loginBtn.layer.cornerRadius = 10;
    self.loginBtn.layer.masksToBounds = YES;
}
- (void)setupAnimation
{
    self.tittleCenterYLayout.constant -= SCREEN_WIDTH;
    self.phoneCenterYLayout.constant -= SCREEN_WIDTH;
    self.passcodeCenterYLayout.constant -= SCREEN_WIDTH;
    self.loginBtnCenterYLayout.constant -= SCREEN_WIDTH;
    self.clound1.alpha = 0.0;
    self.clound2.alpha = 0.0;
    self.clound3.alpha = 0.0;
    self.clound4.alpha = 0.0;
}
- (void)loadAnimation
{
    [UIView animateWithDuration:0.5 animations:^{
        self.tittleCenterYLayout.constant += SCREEN_WIDTH;
        [self.view layoutIfNeeded];
    }];
    
    [UIView animateWithDuration:0.5 delay:0.3 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.phoneCenterYLayout.constant += SCREEN_WIDTH;
        [self.view layoutIfNeeded];
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.passcodeCenterYLayout.constant += SCREEN_WIDTH;
        [self.view layoutIfNeeded];
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.loginBtnCenterYLayout.constant += SCREEN_WIDTH;
        [self.view layoutIfNeeded];
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.clound1.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.7 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.clound2.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.9 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.clound3.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:1.1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.clound4.alpha = 1.0;
    } completion:nil];
}
@end
