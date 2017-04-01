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
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
// 控件约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tittleCenterYLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *phoneCenterYLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passcodeCenterYLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBtnCenterYLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBtnCenterYYLayout;

// 动作
- (IBAction)loginBtnClick:(id)sender;


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
    
    [self.loginBtn addSubview:({
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        spinner.frame = CGRectMake(-50.0, 6.0, 20.0, 20.0);
//        spinner.alpha = 0.0;
        [spinner startAnimating];
        self.spinner = spinner;
        spinner;
    })];
}
#pragma mark - 动画相关
- (void)setupAnimation
{
    self.tittleCenterYLayout.constant -= SCREEN_WIDTH;
    self.phoneCenterYLayout.constant -= SCREEN_WIDTH;
    self.passcodeCenterYLayout.constant -= SCREEN_WIDTH;
    self.loginBtnCenterYYLayout.constant += 30;
    self.loginBtn.alpha = 0.0;
    self.clound1.alpha = 0.0;
    self.clound2.alpha = 0.0;
    self.clound3.alpha = 0.0;
    self.clound4.alpha = 0.0;
}
- (void)loadAnimation
{
    // view 动画
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

    // spring动画
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.loginBtn.alpha = 1.0;
        self.loginBtnCenterYYLayout.constant -= 30;
        [self.view layoutIfNeeded];
    } completion:nil];
}

#pragma mark - 内部方法
- (IBAction)loginBtnClick:(id)sender {
    
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:0.2 initialSpringVelocity:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.loginBtn.width += 80;
        self.loginBtn.enabled = NO;
    } completion:nil];
    
    [UIView animateWithDuration:0.33 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.loginBtnCenterYYLayout.constant += 60.0;
        self.loginBtn.backgroundColor = [UIColor colorWithDisplayP3Red:0.85 green:0.83 blue:0.45 alpha:1.0];
        self.spinner.alpha = 1.0;
        self.spinner.center = CGPointMake(40.0, self.loginBtn.height * 0.5);
        [self.view layoutIfNeeded];
    } completion:nil];
}
@end
