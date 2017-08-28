//
//  CustomSizeModalBaseController.m
//  Store
//
//  Created by Ilya Dolgopolov on 31.03.17.
//  Copyright © 2017 llodi. All rights reserved.
//

#import "CustomSizeModalBaseController.h"
#import "UICustomTransitionOption.h"

@interface CustomSizeModalBaseController ()

@property (nonatomic) UIView *dimmingView;

@end

@implementation CustomSizeModalBaseController

- (instancetype) initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    
    if (self) {
        [self setupDimmingView];
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
         [self.dimmingView setAlpha:0.85];
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

- (UIView *)dimmingView {
    if(!_dimmingView) _dimmingView = [[UIView alloc] init];
    return _dimmingView;
}

- (void) setupDimmingView {
    self.dimmingView.translatesAutoresizingMaskIntoConstraints = NO;
    self.dimmingView.backgroundColor = [UIColor blackColor];
    self.dimmingView.alpha = 0.85;
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.dimmingView addGestureRecognizer:recognizer];
}

- (void) handleTap: (UITapGestureRecognizer *) recognizer {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end
