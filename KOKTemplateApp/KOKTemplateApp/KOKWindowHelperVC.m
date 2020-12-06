//
//  KOKWindowHelperVC.m
//  KOKTemplateApp
//
//  Created by KOK on 4/12/2020.
//

#import "KOKWindowHelperVC.h"

@implementation KOKWindowHelperVC
@synthesize vc = _vc;
static KOKWindowHelperVC * kokWindowHelperVC = nil;
+ (KOKWindowHelperVC *)shared{
    @synchronized(self){
         if (kokWindowHelperVC == nil) {
             kokWindowHelperVC = [[KOKWindowHelperVC alloc]init];
         }
     }
     return kokWindowHelperVC;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.window  = [[KOKWIndow alloc]initWithFrame: [UIScreen mainScreen].nativeBounds];
    }
    return self;
}
- (void)enable{
    
    if (self.window.rootViewController  != self.vc) {
        self.window.rootViewController = self.vc;
//        self.window.
        NSLog(@"1");
        self.window.hidden = NO;
    }
    
   static  BOOL success = NO;
    for (NSInteger i = 0; i<10; i++) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 *
                                                                  NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (success == YES) {
                return;
            }
            NSLog(@"2");
            for (UIWindowScene * scene in  UIApplication.sharedApplication.connectedScenes) {
                if ( [scene isEqual:self.window.windowScene]) {
                    success = YES;
                    NSLog(@"3");
                    
                }
            }
            
        });
    }
    
}
- (void)disable{
    if(self.window.rootViewController != nil){
        self.window.rootViewController = nil;
        self.window.hidden = YES;
    }
}
-(UIViewController *)vc{
    if (!_vc) {
        _vc = [[UIViewController alloc] init];
        _vc.view.backgroundColor = [UIColor redColor];
    }
    return _vc;
}
@end
