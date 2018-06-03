//
//  CustomSizeModalBaseController.h
//  Store
//
//  Created by Ilya Dolgopolov on 31.03.17.
//  Copyright © 2017 llodi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICustomTransitionOption.h"

@class DimmingView;

@interface CustomSizeModalBaseController : UIPresentationController

@property (nonatomic) CGFloat backgroundViewAlpha;
@property (nonatomic) UIColor *backgroundViewColor;
@property (nonatomic) TapOnBackgroundViewHandler onTapOnBackgroundView;

- (instancetype) initWithPresentedViewController:(UIViewController *)presentedViewController
                        presentingViewController:(UIViewController *)presentingViewController
                                 dimmingView: (DimmingView *) dimView;
@end
