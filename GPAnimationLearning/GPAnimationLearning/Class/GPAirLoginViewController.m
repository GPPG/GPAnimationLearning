//
//  GPAirLoginViewController.m
//  GPAnimationLearning
//
//  Created by 郭鹏 on 2017/4/1.
//  Copyright © 2017年 郭鹏. All rights reserved.
//

#import "GPAirLoginViewController.h"
#import "GPFlighData.h"
#import "GPSnowView.h"

@interface GPAirLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *flightLabel;
@property (weak, nonatomic) IBOutlet UILabel *FlightNO;
@property (weak, nonatomic) IBOutlet UILabel *boardingLabel;
@property (weak, nonatomic) IBOutlet UILabel *boardingNOLabel;
@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrivalPointLabel;
@property (weak, nonatomic) IBOutlet UIImageView *airImageView;
@property (weak, nonatomic) IBOutlet UIImageView *statusImageView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (nonatomic, strong) GPSnowView *snowView;
@property (nonatomic, strong) GPFlighData *beiJingFlightData;
@property (nonatomic, strong) GPFlighData *sahngHaiFlightData;
@end

typedef NS_ENUM(NSInteger,AnimationDirection){
    positive = 1,
    negative = -1
};

@implementation GPAirLoginViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

#pragma mark - 初始化方法
- (void)setupView
{
    [self.topView addSubview:({
        GPSnowView *snowView = [[GPSnowView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        self.snowView = snowView;
        snowView;
    })];
    [self changFlightData:self.beiJingFlightData animated:NO];
}
#pragma mark - 内部方法
- (void)changFlightData:(GPFlighData *)flightData animated:(BOOL)isAnimated
{
    self.topLabel.text = flightData.summaryStr;

    AnimationDirection direction = flightData.isTakingOff ? positive : negative;
    if (isAnimated) {
        // 背景图片更换
        [self fadeImageView:[UIImage imageNamed:flightData.weatherImageNameStr] showEffects:flightData.isShowWeatherEffects];
        // 航班号和登机口
        [self cubeTransition:self.FlightNO text:flightData.flightNrStr direction:direction];
        [self cubeTransition:self.boardingNOLabel text:flightData.gateNrStr direction:direction];
    }
    else{ // 第一次,不用动画直接赋值
        self.FlightNO.text = flightData.flightNrStr;
        self.boardingNOLabel.text = flightData.gateNrStr;
        self.originLabel.text = flightData.departingFromStr;
        self.arrivalPointLabel.text = flightData.arrivingToStr;
        self.statusLabel.text = flightData.flightStatusStr;
        self.bgImageView.image = [UIImage imageNamed:flightData.weatherImageNameStr];
        self.snowView.hidden = !flightData.isShowWeatherEffects;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self changFlightData:flightData.isTakingOff ? self.sahngHaiFlightData : self.beiJingFlightData animated:YES];
    });
}

#pragma mark - 动画相关
// 图片
- (void)fadeImageView:(UIImage *)toImage showEffects:(BOOL)showEffects
{
    // 背景图片
    [UIView transitionWithView:self.bgImageView duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.bgImageView.image = toImage;
    } completion:nil];
    
    // 雪花发射器
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.snowView.alpha = showEffects ? 1.0 : 0.0;
    } completion:nil];
}
// 航班号&登机口
- (void)cubeTransition:(UILabel *)label text:(NSString *)text direction:(AnimationDirection)direction
{
    CGFloat auxLabelOffset = direction * label.height * 0.5;
    CGAffineTransform transScaleForm = CGAffineTransformMakeScale(1.0, 0.1);
    CGAffineTransform tempTop = CGAffineTransformMakeTranslation(0.0, auxLabelOffset);
    CGAffineTransform tempDow = CGAffineTransformMakeTranslation(0.0, -auxLabelOffset);
    CGAffineTransform transTopForm = CGAffineTransformConcat(transScaleForm, tempTop);
    CGAffineTransform transDowForm = CGAffineTransformConcat(transScaleForm, tempDow);
    
    UILabel *auxLabel = [[UILabel alloc]initWithFrame:label.frame];
    [label.superview addSubview:({
        auxLabel.backgroundColor = [UIColor clearColor];
        auxLabel.text = text;
        [auxLabel sizeToFit];
        auxLabel.font = label.font;
        auxLabel.textAlignment = label.textAlignment;
        auxLabel.textColor = label.textColor;
        auxLabel.transform = transTopForm;
        auxLabel;
    })];
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        auxLabel.transform = CGAffineTransformIdentity;
        label.transform = transDowForm;
    } completion:^(BOOL finished) {
        label.text = auxLabel.text;
        [label sizeToFit];
        label.transform = CGAffineTransformIdentity;
        [auxLabel removeFromSuperview];
    }];
}
// 出发点和到达点


#pragma mark - 懒加载
- (GPFlighData *)beiJingFlightData
{
    if (!_beiJingFlightData) {
        _beiJingFlightData = [[GPFlighData alloc]initWithIsBeiJing:YES];
    }
    return _beiJingFlightData;
}
- (GPFlighData *)sahngHaiFlightData
{
    if (!_sahngHaiFlightData) {
        _sahngHaiFlightData = [[GPFlighData alloc]initWithIsBeiJing:NO];
    }
    return _sahngHaiFlightData;
}
@end
