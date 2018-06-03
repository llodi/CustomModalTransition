//
//  TransitorHelper.h
//  Store
//
//  Created by Ilya on 24.03.17.
//  Copyright © 2017 llodi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICustomTransitionOption.h"

@class DimmingView;

@interface CustomModalTransition : NSObject <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property (nonatomic) NSTimeInterval animationDuration;

- (instancetype) initWithOption: (UICustomTransitionOption) option
             horizontalInsets: (CGFloat) insets
                   hiewHeight: (CGFloat) height;

- (instancetype) initWithOption: (UICustomTransitionOption) option
                 dimmingView: (DimmingView *) dimmingView
               horizontalInsets: (CGFloat) insets
                     hiewHeight: (CGFloat) height;

@end
