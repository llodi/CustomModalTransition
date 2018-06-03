//
//  CustomSizeModalBaseController.m
//  Store
//
//  Created by Ilya Dolgopolov on 31.03.17.
//  Copyright © 2017 llodi. All rights reserved.
//

#import "CustomSizeModalBaseController.h"
#import "DimmingView.h"

@interface CustomSizeModalBaseController ()

@property (nonatomic) DimmingView *dimmingView;

@end

@implementation CustomSizeModalBaseController

- (instancetype) initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    
    if (self) {
        
        self.dimmingView = [[DimmingView alloc] initWithBackgroundColor:[UIColor blackColor] dimmingAlpha:0.85 enabledTap:YES];
        __weak typeof(self) weakSelf = self;
        self.dimmingView.onBackgroundView = ^{
            __strong typeof(self) strongSelf = weakSelf;
            if (strongSelf) {
                [strongSelf.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            }
        };
    }
    
    return self;
}

- (instancetype) initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController dimmingView: (DimmingView *) dimView
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    
    if (self) {
        self.dimmingView = dimView;
    }
    
    return self;
}


#pragma mark - UIPresentationController methods

- (CGRect)frameOfPresentedViewInContainerView {
    
    return CGRectZero;
}

- (void)presentationTransitionWillBegin {
    
    UIView *containerView = self.containerView;
    
    UIViewController *presentedViewController = self.presentedViewController;
    
    [self.dimmingView setFrame:containerView.bounds];
    self.dimmingView.alpha = 0.0;
    
    [self.containerView addSubview:self.dimmingView];
    
    [presentedViewController.transitionCoordinator
     animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context)
     {
         [self.dimmingView setAlpha: self.dimmingView.dimmingAlpha];
     } completion:nil];
}

- (void) dismissalTransitionWillBegin {
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context)
     {
         [self.dimmingView setAlpha:0.0];
     } completion:nil];
}

- (void)containerViewWillLayoutSubviews {
    [self.dimmingView setFrame:self.containerView.bounds];
    [self.presentedView setFrame:self.frameOfPresentedViewInContainerView];
}

#pragma mark - setup dimming view

//- (UIView *)dimmingView {
//    if(!_dimmingView) _dimmingView = [[DimmingView alloc] init];
//    return _dimmingView;
//}

//- (void) setupDimmingViewWithEnabledTap: (Boolean) tapEnabled {
//    self.dimmingView.translatesAutoresizingMaskIntoConstraints = NO;
//    self.dimmingView.backgroundColor = [UIColor blackColor];
//    self.dimmingView.alpha = 0.85;
//    if (tapEnabled) {
//        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
//        [self.dimmingView addGestureRecognizer:recognizer];
//    }
//}
//
//- (void) handleTap: (UITapGestureRecognizer *) recognizer {
//    if (self.onTapOnBackgroundView) {
//        self.onTapOnBackgroundView();
//    }
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
//}


@end
