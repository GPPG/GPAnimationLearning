//
//  GPGrabienAnimationViewController.m
//  GPAnimationLearning
//
//  Created by 郭鹏 on 2017/5/16.
//  Copyright © 2017年 郭鹏. All rights reserved.
//

#import "GPGrabienAnimationViewController.h"
#import "GPAnimatedMaskLabelView.h"

@interface GPGrabienAnimationViewController()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet GPAnimatedMaskLabelView *animatedView;
@end


@implementation GPGrabienAnimationViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    self.animatedView.textStr = @"滑动解锁";
}


@end
