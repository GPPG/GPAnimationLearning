//
//  GPAnimatedMaskLabelView.m
//  GPAnimationLearning
//
//  Created by 郭鹏 on 2017/5/16.
//  Copyright © 2017年 郭鹏. All rights reserved.
//

#import "GPAnimatedMaskLabelView.h"


@interface GPAnimatedMaskLabelView()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (nonatomic, strong) NSDictionary *textAttributesDic;

@end

@implementation GPAnimatedMaskLabelView

- (void)didMoveToWindow
{
    [super didMoveToWindow];
    
    CABasicAnimation *gradientAnimation = [CABasicAnimation animationWithKeyPath:animationLocations];
    gradientAnimation.fromValue = @[@(0.0), @(0.0), @(0.25)];
    gradientAnimation.toValue = @[@(0.75), @(1.0), @(1.0)];
    gradientAnimation.duration = 3.0;
    gradientAnimation.repeatCount = CGFLOAT_MAX;
    [self.gradientLayer addAnimation:gradientAnimation forKey:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
    self.gradientLayer.frame = CGRectMake(-self.width, self.y, self.width * 3, self.height);
    [self.layer addSublayer:self.gradientLayer];
}

#pragma mark - set,get
- (void)setTextStr:(NSString *)textStr
{
    _textStr = textStr;
    
    [self setNeedsDisplay];
    UIGraphicsImageRenderer *imageRender = [[UIGraphicsImageRenderer alloc]initWithSize:self.bounds.size];
    UIImage *image = [imageRender imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
        [textStr drawInRect:self.bounds withAttributes:self.textAttributesDic];
    }];
    
    CALayer *maskLayer = [[CALayer alloc]init];
    maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    maskLayer.frame = self.bounds;
    maskLayer.contents = CFBridgingRelease(image.CGImage);
    self.gradientLayer.mask = maskLayer;
}

- (NSDictionary *)textAttributesDic
{
    if (!_textAttributesDic) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
        style.alignment = NSTextAlignmentCenter;
        _textAttributesDic = @{
                               NSFontAttributeName: [UIFont fontWithName:@"Zapfino"size:22.0],
                               NSParagraphStyleAttributeName : style,
                               };
    }
    return _textAttributesDic;
}
- (CAGradientLayer *)gradientLayer
{
    if (!_gradientLayer) {
        _gradientLayer = [[CAGradientLayer alloc]init];
        _gradientLayer.startPoint = CGPointMake(0, 0.5);
        _gradientLayer.endPoint = CGPointMake(1.0, 0.5);
        NSArray *colors = @[(__bridge id)[UIColor blackColor].CGColor,(__bridge id)[UIColor whiteColor].CGColor,(__bridge id)[UIColor blackColor].CGColor];
        _gradientLayer.colors = colors;
        NSArray *locations = @[@(0.25),@(0.5),@(0.75)];
        _gradientLayer.locations = locations;
    }
    return _gradientLayer;
}

@end
