//
//  TransitorHelper.m
//  Store
//
//  Created by Ilya on 24.03.17.
//  Copyright © 2017 llodi. All rights reserved.
//

#import "TransitorHelper.h"
#import "CustomSizeModalController.h"

@interface CustomModalTransition ()

@property (nonatomic) BOOL isPresenting;

@property (nonatomic) UICustomTransitionOption option;
@property (nonatomic) CGFloat horizontalInsets;
@property (nonatomic) CGFloat viewHeight;

@end

@implementation CustomModalTransition

- (instancetype) initWithOption: (UICustomTransitionOption) option
                horizontalInsets: (CGFloat) insets
                      hiewHeight: (CGFloat) height
{
    self = [super init];
    if(self) {
        self.option = option;
        self.horizontalInsets = insets;
        self.viewHeight = height;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    if (self.animationDuration) {
        return self.animationDuration;
    }
    return 0.35;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UITransitionContextViewControllerKey key = self.isPresenting ? UITransitionContextToViewControllerKey : UITransitionContextFromViewControllerKey;
    UIViewController *controller = [transitionContext viewControllerForKey: key];
    
    if(self.isPresenting) {
        [transitionContext.containerView addSubview:controller.view];
    }
    
    CGRect presentedFrame = [transitionContext finalFrameForViewController:controller];
    CGRect dismissedFrame = presentedFrame;
    
    dismissedFrame.origin.y = transitionContext.containerView.frame.size.height + self.horizontalInsets;
    
    CGRect initialFrame = self.isPresenting ? dismissedFrame : presentedFrame;
    CGRect finalFrame = self.isPresenting ? presentedFrame : dismissedFrame;
    
    NSTimeInterval animationDuration = [self transitionDuration:transitionContext];
    
    switch (self.option) {
        case UICustomTransitionOptionCenter:
            controller.view.frame = finalFrame;//initialFrame;
            controller.view.transform = CGAffineTransformMakeScale(0, 0);
            break;
        case UICustomTransitionOptionBottom:
            controller.view.frame = initialFrame;
            break;
        default:
            controller.view.frame = initialFrame;
            break;
    }
    
    [UIView animateKeyframesWithDuration:animationDuration delay:0 options:0 animations:^{
        
        switch (self.option) {
            case UICustomTransitionOptionCenter:
                controller.view.transform = CGAffineTransformIdentity;
                break;
            case UICustomTransitionOptionBottom:
                controller.view.frame = finalFrame;
                break;
            default:
                controller.view.frame = finalFrame;
                break;
        }
        
        controller.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}


#pragma mark - UIViewControllerTransitioningDelegate

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                      presentingViewController:(UIViewController *)presenting
                                                          sourceViewController:(UIViewController *)source
{
    self.isPresenting = YES;
    CustomSizeModalController *customVC = [[CustomSizeModalController alloc]
                                           initWithPresentedViewController:presented
                                           presentingViewController:presenting
                                           option:self.option
                                           withHorizontalInsets:self.horizontalInsets
                                           viewHeight:self.viewHeight];
    return customVC;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.isPresenting = YES;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.isPresenting = NO;
    return self;
}

@end
