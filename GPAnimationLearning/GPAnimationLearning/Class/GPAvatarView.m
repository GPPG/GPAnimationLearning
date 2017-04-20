//
//  GPAvatarView.m
//  GPAnimationLearning
//
//  Created by 郭鹏 on 2017/4/18.
//  Copyright © 2017年 郭鹏. All rights reserved.
//

#import "GPAvatarView.h"

IB_DESIGNABLE

#define LineWidth 6
#define AnimationDuration 1

@interface GPAvatarView()
@property (nonatomic, copy) IBInspectable NSString *name;
@property (nonatomic, strong) IBInspectable UIImage *image;
@property (nonatomic, strong) CALayer *photoLayer;
@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) CAShapeLayer *maskLayer;

@end

@implementation GPAvatarView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addView];
    }
    return self;
}

- (void)addView
{
    
}
#pragma mark - set
- (void)setName:(NSString *)name
{
    if (name.length) {
        <#statements#>
    }
}
@end
