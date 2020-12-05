//
//  HomeViewController.m
//  KOKTemplateApp
//
//  Created by KOK on 4/12/2020.
//

#import "HomeViewController.h"
#import "YYFPSLabel.h"
#import "SceneDelegate.h"
#import "KOKLuckyLotteryView.h"
#import "ResultViewController.h"
@interface HomeViewController ()
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@property (nonatomic, strong) CAEmitterLayer * rainLayer;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Chirsmas";
    [self setupEmitter];
    
    UIImageView * bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:bg];
    bg.image = [UIImage imageNamed:@"imgBG"];
    
//    self.view.backgroundColor = UIColorFromRGB(0x2e1a3d);
//    self.view.backgroundColor = UIColorFromRGB(0x4c0002);
    KOKLuckyLotteryView * view = [KOKLuckyLotteryView newView];
    [self.view addSubview:view];
//    view.backgroundColor =  UIColorFromRGB(0x2e1a3d);
    view.vc = self;
//    view.backgroundColor = UIColorFromRGB(0x4c0002);
//    _fpsLabel = [YYFPSLabel new];
//    _fpsLabel.frame = CGRectMake(200, 200, 50, 30);
//    [_fpsLabel sizeToFit];
//    [self.view addSubview:_fpsLabel];
//    UIWindow *window2 = [[UIWindow alloc]initWithWindowScene:[SceneDelegate shared].windowScene];
////
////    UIWindowScene *windowScene2= [UIWindowScene alloc]initWithSession: connectionOptions:(nonnull UISceneConnectionOptions *)
//    window2.frame = CGRectMake(200, 200, 200, 200);
//    
//    UIViewController *vc =     [[UIViewController alloc]init];
//    vc.view.backgroundColor = [UIColor redColor];
//    window2.rootViewController = vc;
//    window2.windowLevel = 100000;
//    window2.hidden = NO;
//    [window2 makeKeyAndVisible];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    ResultViewController *vc = [[ResultViewController alloc]initWithNibName:@"ResultViewController" bundle:[NSBundle mainBundle]];
//    [self presentViewController:vc animated:YES completion:^{}];
//}
- (void)setupEmitter{

    // 1. 设置CAEmitterLayer
    CAEmitterLayer * rainLayer = [CAEmitterLayer layer];
    [self.imageView.layer addSublayer:rainLayer];
    self.rainLayer = rainLayer;
    
    rainLayer.emitterShape = kCAEmitterLayerLine;
    rainLayer.emitterMode = kCAEmitterLayerSurface;
    rainLayer.emitterSize = self.view.frame.size;
    rainLayer.emitterPosition = CGPointMake(self.view.bounds.size.width * 0.5, -10); // y最好不要设置为0 最好<0
    
    // 2. 配置cell
    CAEmitterCell * snowCell = [CAEmitterCell emitterCell];
    snowCell.contents = (id)[[UIImage imageNamed:@"snow_white"] CGImage];
    
    snowCell.birthRate = 40.f;
    snowCell.lifetime = 10;
    snowCell.speed = 0.1f;
    
    snowCell.velocity = 10.f;
    snowCell.velocityRange = 10.f;
    snowCell.yAcceleration = 1000.f;
    
    snowCell.scale = 0.1;
    snowCell.scaleRange = 0.f;
    
    // 3.添加到图层上
    rainLayer.emitterCells = @[snowCell];
}
@end
