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
    [self changFlightData:self.beiJingFlightData];
}
#pragma mark - 内部方法
- (void)changFlightData:(GPFlighData *)flightData
{
    self.topLabel.text = flightData.summaryStr;
    self.FlightNO.text = flightData.flightNrStr;
    self.boardingNOLabel.text = flightData.gateNrStr;
    self.originLabel.text = flightData.departingFromStr;
    self.arrivalPointLabel.text = flightData.arrivingToStr;
    self.statusLabel.text = flightData.flightStatusStr;
    self.bgImageView.image = [UIImage imageNamed:flightData.weatherImageNameStr];
    self.snowView.hidden = !flightData.isShowWeatherEffects;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       [self changFlightData:flightData.isTakingOff ? self.sahngHaiFlightData : self.beiJingFlightData];
    });
}
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
