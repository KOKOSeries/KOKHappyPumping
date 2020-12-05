//
//  KOKWindowHelperVC.h
//  KOKTemplateApp
//
//  Created by KOK on 4/12/2020.
//

#import <Foundation/Foundation.h>
#import "KOKWIndow.h"
NS_ASSUME_NONNULL_BEGIN

@interface KOKWindowHelperVC : NSObject
@property KOKWIndow * window;
@property (nonatomic) UIViewController *vc;
+ (KOKWindowHelperVC *)shared;
- (void)enable;
@end

NS_ASSUME_NONNULL_END
