//
//  GPShapeViewController.m
//  GPAnimationLearning
//
//  Created by 郭鹏 on 2017/4/18.
//  Copyright © 2017年 郭鹏. All rights reserved.
//

#import "GPShapeViewController.h"
#import "GPAvatarView.h"

@interface GPShapeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *vsLabel;
@property (weak, nonatomic) IBOutlet UIButton *searchAgainBtn;
@property (weak, nonatomic) IBOutlet GPAvatarView *myAvatar;
@property (weak, nonatomic) IBOutlet GPAvatarView *opponentAvatar;
- (IBAction)searchAgainBtnClick:(UIButton *)sender;
@end

@implementation GPShapeViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}
#pragma mark - 初始化
- (void)setupView
{
    self.myAvatar.name = @"我";
    self.myAvatar.image = [UIImage imageNamed:@"avatar-1"];
    self.opponentAvatar.name = @"一剑飞仙";
    self.opponentAvatar.image = [UIImage imageNamed:@"empty"];
}
#pragma mark - 内部方法
- (IBAction)searchAgainBtnClick:(UIButton *)sender {
    
}
@end
