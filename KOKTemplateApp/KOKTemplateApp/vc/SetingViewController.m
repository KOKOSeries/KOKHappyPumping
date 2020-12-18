//
//  SetingViewController.m
//  KOKTemplateApp
//
//  Created by KOK on 4/12/2020.
//

#import "SetingViewController.h"
#import "OpensourceSDKVC.h"
#import "YYFPSLabel.h"
#import <SafariServices/SafariServices.h>
@interface SetingViewController ()

/// header View
@property (weak, nonatomic) IBOutlet UIView *headView;
#pragma mark - one

/// left logo image
@property (weak, nonatomic) IBOutlet UIImageView *leftimageViewA;

/// right logo image
@property (weak, nonatomic) IBOutlet UIImageView *rightimageViewA;

/// tittle image
@property (weak, nonatomic) IBOutlet UILabel *titleLabelA;


#pragma mark - two
/// left logo image
@property (weak, nonatomic) IBOutlet UIImageView *leftimageViewB;

/// right logo image
@property (weak, nonatomic) IBOutlet UIImageView *rightimageViewB;

/// tittle image
@property (weak, nonatomic) IBOutlet UILabel *titleLabelB;

#pragma mark - three
/// left logo image
@property (weak, nonatomic) IBOutlet UIImageView *leftimageViewC;

/// right logo image
@property (weak, nonatomic) IBOutlet UIImageView *rightimageViewC;

/// tittle image
@property (weak, nonatomic) IBOutlet UILabel *titleLabelC;

#pragma mark - four
/// left logo image
@property (weak, nonatomic) IBOutlet UIImageView *leftimageViewD;

/// right logo image
@property (weak, nonatomic) IBOutlet UIImageView *rightimageViewD;

/// tittle image
@property (weak, nonatomic) IBOutlet UILabel *titleLabelD;

#pragma mark - five
/// left logo image
@property (weak, nonatomic) IBOutlet UIImageView *leftimageViewE;

/// right logo image
@property (weak, nonatomic) IBOutlet UIImageView *rightimageViewE;

/// tittle image
@property (weak, nonatomic) IBOutlet UILabel *titleLabelE;


/// fps 
@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *logoname;

@end

@implementation SetingViewController
- (IBAction)backButtonClick:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0:{ 
            NSLog(@"%ld",sender.tag);
            OpensourceSDKVC *vc = [[OpensourceSDKVC alloc]initWithNibName:@"OpensourceSDKVC" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController: vc animated:YES];
        } break;
        case 1:{
            NSLog(@"%ld",sender.tag);
            NSURL *url = [NSURL URLWithString:@"https://kokoseries.github.io/KOKHappyPumping/"];
            SFSafariViewController *vc = [[SFSafariViewController alloc]initWithURL:url];
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:vc animated:YES completion:^{}];
        }break;
        case 2:{
            NSURL *url = [NSURL URLWithString:@"https://kokoseries.github.io/KOKHappyPumping/"];
            SFSafariViewController *vc = [[SFSafariViewController alloc]initWithURL:url];
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:vc animated:YES completion:^{}];
        }break;
        case 3:{
            NSURL *url = [NSURL URLWithString:@"https://kokoseries.github.io/KOKHappyPumping/"];
            SFSafariViewController *vc = [[SFSafariViewController alloc]initWithURL:url];
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:vc animated:YES completion:^{}];
        }break;
        case 4:{
            NSURL *url = [NSURL URLWithString:@"https://kokoseries.github.io/KOKHappyPumping/"];
            SFSafariViewController *vc = [[SFSafariViewController alloc]initWithURL:url];
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:vc animated:YES completion:^{}];
        }break;
        case 5:{
            NSLog(@"%ld",sender.tag);
        }break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabelA.text = @"Open source Data";
    self.titleLabelB.text = @"About us";
    self.titleLabelC.text = @"Privacy policy";
    self.titleLabelD.text = @"Suport web";
    self.titleLabelE.text = @"My Plane";
    self.logo.layer.cornerRadius = 91;
    self.logo.layer.masksToBounds = YES;
//    self.rightimageViewA.image = [UIImage imageNamed:@"right"];
//    self.rightimageViewB.image = [UIImage imageNamed:@"right"];
//    self.rightimageViewC.image = [UIImage imageNamed:@"right"];
//    self.rightimageViewD.image = [UIImage imageNamed:@"right"];
//    self.rightimageViewE.image = [UIImage imageNamed:@"right"];

    
//    self.titleLabelB.text = @"";
    // Do any additional setup after loading the view.
//    _fpsLabel = [YYFPSLabel new];
//    _fpsLabel.frame = CGRectMake(200,e 200, 50, 30);
//    [_fpsLabel sizeToFit];
//    [self.view addSubview:_fpsLabel];
}

@end
