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
#import "RecordViewController.h"
#import "WMDragView.h"
#import "SDCycleScrollView.h"
#import "KxMenu.h"
#import "ShareViewController.h"
#import "SViewController.h"
#import <WHToast/WHToast.h>
@interface HomeViewController ()
@property(nonatomic,strong)WMDragView *dragView;

@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@property (nonatomic, strong) CAEmitterLayer * rainLayer;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIStackView *superView;
@property (weak, nonatomic) IBOutlet UIView *chooseView;
@property (weak, nonatomic) IBOutlet UIImageView *giftImage;

@property (weak, nonatomic) IBOutlet UIView *backImageSuperView;
@property (weak, nonatomic) IBOutlet UIView *giftImageSuperView;
@property (weak, nonatomic) IBOutlet UILabel *greetingsLabel;
@property (weak, nonatomic) IBOutlet UIView *editorGreetingView;
@property (weak, nonatomic) IBOutlet UITextView *greetTextView;
@property (weak, nonatomic) IBOutlet UIView *instroduceView;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *introStep;

@property (weak, nonatomic) IBOutlet UIImageView *intro1;
@property (weak, nonatomic) IBOutlet UIImageView *intro2;
@property (weak, nonatomic) IBOutlet UIImageView *intro3;
@property (weak, nonatomic) IBOutlet UIImageView *intro4;
@property (weak, nonatomic) IBOutlet UIImageView *intro5;
@property (weak, nonatomic) IBOutlet UIImageView *intro6;
@property (weak, nonatomic) IBOutlet UIImageView *intro7;
@property (weak, nonatomic) IBOutlet UIImageView *intro8;
@property (weak, nonatomic) IBOutlet UIImageView *intro9;

@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UIImageView *cardImage;
@property (weak, nonatomic) IBOutlet UIView *cardOrignalView;

@end

@implementation HomeViewController
- (IBAction)button:(UIBarButtonItem *)sender {
    RecordViewController *vc = [[RecordViewController alloc]initWithNibName:@"RecordViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Chirsmas Gifts";
    self.dragView = [[WMDragView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 60 ,[UIScreen mainScreen].bounds.size.height/2, 40, 40)];
    self.dragView.imageView.image = [UIImage imageNamed:@"Logo"];
    self.dragView.imageView.backgroundColor = [UIColor blackColor];
    self.dragView.button.titleLabel.font = [UIFont systemFontOfSize:15.0];
    self.dragView.backgroundColor = [UIColor clearColor];
    self.dragView.layer.masksToBounds = YES;
    self.dragView.layer.cornerRadius = 20;
    [self.view addSubview:self.dragView];
    __weak __typeof(self)weakSelf = self;
    self.dragView.clickDragViewBlock = ^(WMDragView *dragView) {
        weakSelf.chooseView.hidden = !weakSelf.chooseView.hidden;
    };
//    self.dragView.center = self.view.center;
    
//    UIImageView * bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    [self.view addSubview:bg];
//    bg.image = [UIImage imageNamed:@"imgBG"];
    
//    self.view.backgroundColor = UIColorFromRGB(0x2e1a3d);
//    self.view.backgroundColor = UIColorFromRGB(0x4c0002);
//    KOKLuckyLotteryView * view = [KOKLuckyLotteryView newView];
//    [self.view addSubview:view];
////    view.backgroundColor =  UIColorFromRGB(0x2e1a3d);
//    view.vc = self;
   
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
//    [self.imageView bringSubviewToFront:view];
    
    self.imageView2 = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.imageView2];
    [self setupEmitter];
    self.superView.layer.masksToBounds = YES;
    self.superView.layer.cornerRadius = 6;
    self.giftImageSuperView.layer.masksToBounds = YES;
    self.giftImageSuperView.layer.cornerRadius = 6;
    self.backImageSuperView.layer.masksToBounds = YES;
    self.backImageSuperView.layer.cornerRadius = 6;
    [self setBackImageInfo];
    [self setGiftImageInfo];
    self.chooseView.hidden = YES;
}
- (void)setBackImageInfo{
    NSArray *titles = @[@"back0",
                        @"back1",
                        @"back2",
                        @"back3",
                        @"back4",
                        @"back5",
                        @"back6",
                        @"back7",
                        @"back8",
    ];
    NSArray *images = @[@"back0",
                        @"back1",
                        @"back2",
                        @"back3",
                        @"back4",
                        @"back5",
                        @"back6",
                        @"back7",
                        @"back8",
    ];
    SDCycleScrollView *introduceCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0,self.backImageSuperView.bounds.size.width,self.backImageSuperView.bounds.size.width)
                                                                           shouldInfiniteLoop:YES imageNamesGroup:images];
    introduceCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    __weak __typeof(self)weakSelf = self;
    introduceCycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        weakSelf.imageView.image = [UIImage imageNamed:images[currentIndex]];

    };
    introduceCycleScrollView.titlesGroup = titles;
    [self.backImageSuperView addSubview:introduceCycleScrollView];
   
}
- (void)setGiftImageInfo{
    NSArray *titles = @[@"棒棒糖",
                        @"包包",
                        @"笔记本",
                        @"可乐",
                        @"裤子",
                        @"老人机",
                        @"梨",
                        @"帽子",
                        @"牛仔帽",
                        @"女装T恤",
                        @"皮带",
                        @"皮鞋",
                        @"皮靴",
                        @"苹果电脑",
                        @"手机",
                        @"水果苹果",
                        @"塑料鞋",
                        @"西瓜",
                        @"洗衣机",
                        @"雪碧",
                        @"运动鞋",
                        @"T恤",
//                        @"",
//                        @"",
//                        @"",
//                        @"",
//                        @"",
    ];
    NSArray *images = @[@"棒棒糖",
                        @"包包",
                        @"笔记本",
                        @"可乐",
                        @"裤子",
                        @"老人机",
                        @"梨",
                        @"帽子",
                        @"牛仔帽",
                        @"女装T恤",
                        @"皮带",
                        @"皮鞋",
                        @"皮靴",
                        @"苹果电脑",
                        @"手机",
                        @"水果苹果",
                        @"塑料鞋",
                        @"西瓜",
                        @"洗衣机",
                        @"雪碧",
                        @"运动鞋",
                        @"T恤",
//                        @"",
//                        @"",
//                        @"",
//                        @"",
//                        @"",
    ];
    SDCycleScrollView *introduceCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0,self.giftImageSuperView.bounds.size.width,self.giftImageSuperView.bounds.size.width)
                                                                           shouldInfiniteLoop:YES imageNamesGroup:images];
    introduceCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    __weak __typeof(self)weakSelf = self;
    introduceCycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        weakSelf.giftImage.image = [UIImage imageNamed:images[currentIndex]];
    };
    introduceCycleScrollView.titlesGroup = titles;
    [self.giftImageSuperView addSubview:introduceCycleScrollView];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    ResultViewController *vc = [[ResultViewController alloc]initWithNibName:@"ResultViewController" bundle:[NSBundle mainBundle]];
//    [self presentViewController:vc animated:YES completion:^{}];
//}
- (void)setupEmitter{

    // 1. 设置CAEmitterLayer
    CAEmitterLayer * rainLayer = [CAEmitterLayer layer];
    [self.imageView2.layer addSublayer:rainLayer];
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
    
    snowCell.scale = 0.3;
    snowCell.scaleRange = 0.f;
    
    // 3.添加到图层上
    rainLayer.emitterCells = @[snowCell];
}
#pragma mark - 祝福语编辑
- (IBAction)grettingsHander:(UIButton *)sender {
    self.editorGreetingView.hidden = !self.editorGreetingView.hidden;
    self.greetingsLabel.text = self.greetTextView.text;
}
- (IBAction)greetingColorHander:(UIButton *)sender {
    NSArray *menuItems =
    @[
      
      [KxMenuItem menuItem:@"Choose Text Color"
                     image:nil
                    target:nil
                    action:NULL],
            
      [KxMenuItem menuItem:@"Bean Paste Pink"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(greetingHanderText:)],
      
      [KxMenuItem menuItem:@"Diamond Green"
                     image:nil
                    target:self
                    action:@selector(greetingHanderText:)],
      
      [KxMenuItem menuItem:@"Fluorescent Green"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(greetingHanderText:)],
      
      [KxMenuItem menuItem:@"Fresh Blue"
                     image:[UIImage imageNamed:@"search_icon"]
                    target:self
                    action:@selector(greetingHanderText:)],
      
      [KxMenuItem menuItem:@"Wood Green"
                     image:[UIImage imageNamed:@"home_icon"]
                    target:self
                    action:@selector(greetingHanderText:)],
      [KxMenuItem menuItem:@"Black"
                     image:[UIImage imageNamed:@"home_icon"]
                    target:self
                    action:@selector(greetingHanderText:)],
      [KxMenuItem menuItem:@"white"
                     image:[UIImage imageNamed:@"home_icon"]
                    target:self
                    action:@selector(greetingHanderText:)],
      [KxMenuItem menuItem:@"Yellow"
                     image:[UIImage imageNamed:@"home_icon"]
                    target:self
                    action:@selector(greetingHanderText:)],
      [KxMenuItem menuItem:@"Red"
                     image:[UIImage imageNamed:@"home_icon"]
                    target:self
                    action:@selector(greetingHanderText:)],
      ];
    
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    
    [KxMenu showMenuInView:self.editorGreetingView
                  fromRect:sender.frame
                 menuItems:menuItems];
}
- (void)greetingHanderText:(id)sender{
    KxMenuItem *item = (id)sender;
    if ([item.title isEqual:@"Bean Paste Pink"]) {
        self.greetingsLabel.textColor = [UIColor colorNamed:@"BeanPastePink"];
    }
    if ([item.title isEqual:@"Diamond Green"]) {
        self.greetingsLabel.textColor = [UIColor colorNamed:@"DiamondGreen"];
    }
    if ([item.title isEqual:@"Fluorescent Green"]) {
        self.greetingsLabel.textColor = [UIColor colorNamed:@"FluorescentGreen"];
    }
    if ([item.title isEqual:@"Fresh Blue"]) {
        self.greetingsLabel.textColor = [UIColor colorNamed:@"FreshBlue"];
    }
    if ([item.title isEqual:@"Wood Green"]) {
        self.greetingsLabel.textColor = [UIColor colorNamed:@"WoodGreen"];
    }
    if ([item.title isEqual:@"Black"]) {
        self.greetingsLabel.textColor = [UIColor blackColor];
    }
    if ([item.title isEqual:@"white"]) {
        self.greetingsLabel.textColor = [UIColor whiteColor];
    }
    if ([item.title isEqual:@"Yellow"]) {
        self.greetingsLabel.textColor = [UIColor yellowColor];
    }
    if ([item.title isEqual:@"Red"]) {
        self.greetingsLabel.textColor = [UIColor redColor];
    }
    if ([item.title isEqual:@"Align left"]) {
        self.greetingsLabel.textAlignment = NSTextAlignmentLeft;
    }
    if ([item.title isEqual:@"Align right"]) {
        self.greetingsLabel.textAlignment = NSTextAlignmentRight;
    }
    if ([item.title isEqual:@"Align center"]) {
        self.greetingsLabel.textAlignment = NSTextAlignmentCenter;
    }
    if ([item.title isEqual:@"Align Natural"]) {
        self.greetingsLabel.textAlignment = NSTextAlignmentNatural;
    }
    if ([item.title isEqual:@"17"]) {
        self.greetingsLabel.font = [UIFont fontWithDescriptor:self.greetingsLabel.font.fontDescriptor size:17];
    }
    if ([item.title isEqual:@"20"]) {
        self.greetingsLabel.font = [UIFont fontWithDescriptor:self.greetingsLabel.font.fontDescriptor size:20];
    }
    if ([item.title isEqual:@"21"]) {
        self.greetingsLabel.font = [UIFont fontWithDescriptor:self.greetingsLabel.font.fontDescriptor size:21];
    }
    if ([item.title isEqual:@"22"]) {
        self.greetingsLabel.font = [UIFont fontWithDescriptor:self.greetingsLabel.font.fontDescriptor size:22];
    }
    if ([item.title isEqual:@"23"]) {
        self.greetingsLabel.font = [UIFont fontWithDescriptor:self.greetingsLabel.font.fontDescriptor size:23];
    }
    if ([item.title isEqual:@"24"]) {
        self.greetingsLabel.font = [UIFont fontWithDescriptor:self.greetingsLabel.font.fontDescriptor size:24];
    }
    if ([item.title isEqual:@"25"]) {
        self.greetingsLabel.font = [UIFont fontWithDescriptor:self.greetingsLabel.font.fontDescriptor size:25];
    }
    if ([item.title isEqual:@"Align Natural"]) {
        self.greetingsLabel.textAlignment = NSTextAlignmentNatural;
    }
}
- (IBAction)greetingAlignHander:(UIButton *)sender {
    NSArray *menuItems =
    @[
      
      [KxMenuItem menuItem:@"Choose Text Align"
                     image:nil
                    target:nil
                    action:NULL],
            
      [KxMenuItem menuItem:@"Align left"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(greetingHanderText:)],
      
      [KxMenuItem menuItem:@"Align right"
                     image:nil
                    target:self
                    action:@selector(greetingHanderText:)],
      
      [KxMenuItem menuItem:@"Align center"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(greetingHanderText:)],
      [KxMenuItem menuItem:@"Align Natural"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(greetingHanderText:)],
      ];
    
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    
    [KxMenu showMenuInView:self.editorGreetingView
                  fromRect:sender.frame
                 menuItems:menuItems];
}
- (IBAction)greetingFontSizeHander:(UIButton *)sender {
    NSArray *menuItems =
    @[
      
      [KxMenuItem menuItem:@"Choose Text Font size"
                     image:nil
                    target:nil
                    action:NULL],
            
     
      [KxMenuItem menuItem:@"17"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(greetingHanderText:)],
      
      [KxMenuItem menuItem:@"20"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(greetingHanderText:)],
      [KxMenuItem menuItem:@"21"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(greetingHanderText:)],
      [KxMenuItem menuItem:@"22"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(greetingHanderText:)],
      
      [KxMenuItem menuItem:@"23"
                     image:nil
                    target:self
                    action:@selector(greetingHanderText:)],
      
      [KxMenuItem menuItem:@"24"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(greetingHanderText:)],
      [KxMenuItem menuItem:@"25"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(greetingHanderText:)],
      ];
    
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    
    [KxMenu showMenuInView:self.editorGreetingView
                  fromRect:sender.frame
                 menuItems:menuItems];
}
#pragma mark - card genrator
- (IBAction)favoritesHander:(UIButton *)sender {
    UIImage *image = [self makeImageWithView:self.cardOrignalView];
    self.cardImage.image = image;
    
    self.cardView.hidden = NO;
}
- (IBAction)saveCard:(UIButton *)sender {
    UIImage *image = [self makeImageWithView:self.cardOrignalView];
    NSString * cardUrl =  [self saveImageToCacheUseImage:image];
    NSMutableArray *array = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"giftCards"]];
    
    if (array.count == 0) {
        [[NSUserDefaults standardUserDefaults] setValue:@[cardUrl] forKey:@"giftCards"];
    }else{
        [array insertObject:cardUrl atIndex:0];
        [[NSUserDefaults standardUserDefaults] setValue:array forKey:@"giftCards"];
        
    }
    
   
   
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    UIImage *ima = [self getCacheImageUseImagePath:cardUrl];
    
    NSLog(@"%@",ima);
//    RecordViewController *vc = [[RecordViewController alloc]initWithNibName:@"RecordViewController" bundle:nil];
//    [self presentViewController:vc animated:YES completion:nil];
    self.cardView.hidden = YES;
}
- (IBAction)cancelSaveCard:(UIButton *)sender {
    self.cardView.hidden = YES;
}

- (IBAction)shareHander:(UIButton *)sender {
//    UIStoryboard *stao = [UIStoryboard storyboardWithName:@"Share" bundle:[NSBundle mainBundle]];
//    ShareViewController *vc = stao.instantiateInitialViewController;
//    ShareViewController *vc = [ShareViewController new];
//    [self presentViewController:vc animated:YES completion:nil];
    
    NSArray *urlArray = (NSArray *)[[NSUserDefaults standardUserDefaults] objectForKey:@"giftCards"];
    
    if (urlArray.count == 0) {
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"Tips" message:@"Please go to make Chrismas gifts card" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVc addAction:okAction];
        [self presentViewController:alertVc animated:YES completion:^{
                    
        }];
//        [WHToast showMessage:@"Please go to make Chrismas gifts card" originY:250 duration:2 finishHandler:^{
//          NSLog(@"省略n行代码");
//        }];
        return;
    }
    SViewController *vc = [[SViewController alloc]init];
    [self presentViewController:vc animated:YES completion:^{
            
    }];
}
#pragma mark - 使用说明
- (IBAction)instructHander:(UIButton *)sender {
    self.dragView.userInteractionEnabled  = NO;
    self.instroduceView.hidden = NO;
    self.intro1.hidden = NO;
    self.instroduceView.tag = 1;
}

- (IBAction)dicInstrut:(UITapGestureRecognizer *)sender {
    switch (self.instroduceView.tag) {
        case 1:{
            self.chooseView.hidden = NO;
            self.instroduceView.tag = 2;
            self.intro1.hidden = YES;
            self.intro2.hidden = NO;
            self.introduceLabel.text = @"choose backimage";
            self.introStep.text = @"Step 2";
        }break;
        case 2:{
            self.instroduceView.tag = 3;
            self.intro2.hidden = YES;
            self.intro3.hidden = NO;
            self.introduceLabel.text = @"choose giftimage";
            self.introStep.text = @"Step 3";
        }break;
        case 3:{
            self.instroduceView.tag = 4;
            self.chooseView.hidden = YES;
            self.introduceLabel.text = @"App statement";
            self.intro3.hidden = YES;
            self.intro4.hidden = NO;
            self.introStep.text = @"Step 4";
        }break;
        case 4:{
            self.instroduceView.tag = 5;
            self.introduceLabel.text = @"App About us";
            self.intro4.hidden = YES;
            self.intro5.hidden = NO;
            self.introStep.text = @"Step 5";
        }break;
        case 5:{
            self.instroduceView.tag = 6;
            self.introduceLabel.text = @"Greetings";
            self.intro5.hidden = YES;
            self.intro6.hidden = NO;
            self.introStep.text = @"Step 6";
        }break;
        case 6:{
            self.instroduceView.tag = 7;
            self.introduceLabel.text = @"instructions";
            self.intro6.hidden = YES;
            self.intro7.hidden = NO;
            self.introStep.text = @"Step 7";
        }break;
        case 7:{
            self.instroduceView.tag = 8;
            self.introduceLabel.text = @"Share";
            self.intro7.hidden = YES;
            self.intro8.hidden = NO;
            self.introStep.text = @"Step 8";
        }break;
        case 8:{
            self.instroduceView.tag = 9;
            self.introduceLabel.text = @"Favorite";
            self.intro8.hidden = YES;
            self.intro9.hidden = NO;
            self.introStep.text = @"Step 9";
        }break;
        case 9:{
            self.instroduceView.hidden = YES;
            self.instroduceView.tag = 1;
            self.intro9.hidden = YES;
            self.intro1.hidden = NO;
            self.introStep.text = @"Step 1";
            self.introduceLabel.text = @"start to make gift card";
            self.dragView.userInteractionEnabled  = YES;
        }break;
        default:
            break;
    }
    
}
- (IBAction)closeInstroHander:(UIButton *)sender {
    self.instroduceView.hidden = YES;
    self.instroduceView.tag = 1;
    self.intro1.hidden = NO;
    self.intro2.hidden = YES;
    self.intro3.hidden = YES;
    
    self.intro4.hidden = YES;
    self.intro5.hidden = YES;
    self.intro6.hidden = YES;
    self.intro7.hidden = YES;
    self.intro8.hidden = YES;
    self.intro9.hidden = YES;
    self.introStep.text = @"Step 1";
    self.introduceLabel.text = @"start to make gift card";
    self.dragView.userInteractionEnabled  = YES;
}


#pragma mark - corlor generator image
- (UIImage *)createImageWithColor: (UIColor *)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
#pragma mark - 生产贺卡图片
- (UIImage *)makeImageWithView:(UIView *)view{

        CGSize s = view.bounds.size;

        UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);

        [view.layer renderInContext:UIGraphicsGetCurrentContext()];

        UIImage*image = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();

        return image;

    }
#pragma mark - 图片存储在沙盒中
- (NSString *)saveImageToCacheUseImage:(UIImage *)image
{
    //获取当前时间戳拼接到文件尾部,防止存储图片多时地址重复
    NSDate *currentDate = [NSDate dateWithTimeIntervalSinceNow:0];
    // *1000 是精确到毫秒，不乘就是精确到秒
    NSTimeInterval currentTime=[currentDate timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%.0f", currentTime];
    
    //这个路径是存储到本地用的图片后缀地址
    NSString *savePath= [NSString stringWithFormat:@"Documents/image_%@.png", timeString];
    //这个路径是将图片存入沙盒时的路径
    NSString *imageAllPath = [NSHomeDirectory() stringByAppendingPathComponent:savePath];
    //存储图片到沙盒,并返回结果
    BOOL result =[UIImagePNGRepresentation(image) writeToFile:imageAllPath atomically:YES];
    
    if (result == YES) {
        NSLog(@"保存成功");
    } else {
        NSLog(@"保存失败");
    }
    return savePath;
}
#pragma mark - 根据图片地址获取图片
- (UIImage *)getCacheImageUseImagePath:(NSString *)imagePath
{
    //防止每次启动程序沙盒前缀地址改变,只存储后边文件路径,调用时再次拼接
    NSString *imageAllPath = [NSHomeDirectory() stringByAppendingPathComponent:imagePath];
    
    return [UIImage imageWithContentsOfFile:imageAllPath];
}
@end
