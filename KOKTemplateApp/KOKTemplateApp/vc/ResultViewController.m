//
//  ResultViewController.m
//  KOKTemplateApp
//
//  Created by KOK on 5/12/2020.
//

#import "ResultViewController.h"

@interface ResultViewController ()
@property (strong,nonatomic) NSMutableArray *array;
@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int y =(arc4random() % self.array.count);
    NSDictionary *image = self.array[y];
    
    self.giftImageView.image = [UIImage imageNamed:image[@"giftImage"]];
    
}
- (NSMutableDictionary * )getDataFromPlist{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"giftList" ofType:@"plist"];
    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    NSLog(@"%@",dataDic);//直接打印数据
    return dataDic;
}
- (NSMutableArray *)array{
    if (!_array) {
        NSMutableDictionary *dictiony =  [self getDataFromPlist];
        NSArray *array = dictiony[@"gifts"];
        _array = [NSMutableArray arrayWithArray:array];
    }
    return _array;
}
@end
