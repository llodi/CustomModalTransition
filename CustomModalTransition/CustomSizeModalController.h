//
//  CustomSizeModalController.h
//  Store
//
//  Created by Ilya Dolgopolov on 25.03.17.
//  Copyright © 2017 llodi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSizeModalBaseController.h"
#import "UICustomTransitionOption.h"


@interface CustomSizeModalController : CustomSizeModalBaseController

@property (nonatomic) CGFloat horizontalInsets;
@property (nonatomic) CGFloat viewHeight;

- (instancetype) initWithPresentedViewController:(UIViewController *)presentedViewController
                        presentingViewController:(UIViewController *)presentingViewController
                                         option:(UICustomTransitionOption)option
                            withHorizontalInsets: (CGFloat) insets
                                      viewHeight: (CGFloat) height;

@end
