//
//  ResultViewController.m
//  KOKTemplateApp
//
//  Created by KOK on 5/12/2020.
//

#import "ResultViewController.h"

@interface ResultViewController ()
@property (strong,nonatomic) NSMutableArray *array;
@property (strong,nonatomic) NSMutableArray *array2;
@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int y =(arc4random() % self.array.count);
    NSDictionary *image = self.array[y];
    self.giftImageView.image = [UIImage imageNamed:image[@"giftImage"]];
    
    
//    NSString *cachePatch = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
//    NSString *filePath = [cachePatch stringByAppendingPathComponent:@"GiftRecord.plist"];
//
//    //将plist文件中数据转换成数组形式输出（要预先知道plist中数据类型，否则无法读出）
//    NSMutableDictionary *products =  [[NSMutableDictionary alloc]initWithContentsOfFile:filePath];
//
//
//    NSLog(@"%@",products);
//    NSDictionary *personInfo = @{
//                                   @"name" : @"amber",
//                                   @"age" : @"18",
//                                   @"height" : @"165"};
//
//
//    @synchronized (self) {
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"GiftRecord" ofType:@"plist"];
//        NSMutableDictionary *dataDic = [[NSMutableDictionary alloc]initWithContentsOfFile:filePath];
//        NSMutableArray  *arrayd = [NSMutableArray arrayWithArray:dataDic[@"gifts"]];
//        NSLog(@"%@",arrayd.lastObject);
//        [arrayd addObject:image];
//        
//        [dataDic setValue:arrayd forKey:@"gifts"];
//        [dataDic writeToURL:filePath atomically:YES];
//    }
    
    
    
    //写入路径
//    NSString *cachePatch = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
//    NSString *filePath = [cachePatch stringByAppendingPathComponent:@"GiftRecord.plist"];
//
//    //将路径转换为本地url形式
//    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
//
//    //writeToURL 的好处是，既可以写入本地url也可以写入远程url，苹果推荐使用此方法写入plist文件
//    [personInfo writeToURL:fileUrl atomically:YES];
    
}
- (NSMutableDictionary * )getDataFromPlist{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"giftList" ofType:@"plist"];
    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
//    NSLog(@"%@",dataDic);//直接打印数据
    return dataDic;
}
- (NSMutableDictionary * )getDataFromPlist2{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"GiftRecord" ofType:@"plist"];
    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
//    NSLog(@"%@",dataDic);//直接打印数据
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
- (NSMutableArray *)array2{
    if (!_array2) {
        NSMutableDictionary *dictiony =  [self getDataFromPlist2];
        NSArray *array = dictiony[@"gifts"];
        _array2 = [NSMutableArray arrayWithArray:array];
    }
    return _array2;
}
@end
