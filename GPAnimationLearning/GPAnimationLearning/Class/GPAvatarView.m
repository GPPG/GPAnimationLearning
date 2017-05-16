//
//  GPAvatarView.m
//  GPAnimationLearning
//
//  Created by 郭鹏 on 2017/4/18.
//  Copyright © 2017年 郭鹏. All rights reserved.
//

#import "GPAvatarView.h"


#define LineWidth 6
#define AnimationDuration 1


@interface GPAvatarView()
@property (nonatomic, strong) CALayer *photoLayer;
@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) CAShapeLayer *maskLayer;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation GPAvatarView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addView];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self addView];
    }
    return self;
}
- (void)addView
{
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.textColor = [UIColor blackColor];
    self.nameLabel = nameLabel;
    
    self.photoLayer = [CALayer layer];
    self.circleLayer = [CAShapeLayer layer];
    self.maskLayer = [CAShapeLayer layer];
}
- (void)didMoveToWindow
{
    [self.layer addSublayer:self.photoLayer];
    self.photoLayer.mask = self.maskLayer;
    [self.layer addSublayer:self.circleLayer];
    [self addSubview:self.nameLabel];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.photoLayer.frame = CGRectMake((self.bounds.size.width - self.image.size.width + LineWidth) * 0.5 , (self.bounds.size.height - self.image.size.height - LineWidth) * 0.5, self.image.size.width, self.image.size.height);
    
    self.circleLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
    self.circleLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.circleLayer.lineWidth = LineWidth;
    self.circleLayer.fillColor = [UIColor clearColor].CGColor;
    
    self.maskLayer.path = self.circleLayer.path;
    self.maskLayer.position = CGPointMake(0, 10);
    
    self.nameLabel.frame = CGRectMake(0, self.bounds.size.height + 10, self.bounds.size.width, 24);
}




#pragma mark - set
- (void)setName:(NSString *)name
{
    _name = name;
    self.nameLabel.text = name;
}
- (void)setImage:(UIImage *)image
{
    _image = image;
    self.photoLayer.contents = CFBridgingRelease(image.CGImage);
}
@end
