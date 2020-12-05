//
//  KOKWIndow.m
//  KOKTemplateApp
//
//  Created by KOK on 4/12/2020.
//

#import "KOKWIndow.h"

@implementation KOKWIndow
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelAlert - 1;
//        UIWindow.Level(rawValue: UIWindow.Level.alert.rawValue - 1)
    }
    return self;
}
@end
