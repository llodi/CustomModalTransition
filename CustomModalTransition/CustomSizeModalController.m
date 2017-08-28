//
//  CustomSizeModalController.m
//  Store
//
//  Created by Ilya Dolgopolov on 25.03.17.
//  Copyright © 2017 llodi. All rights reserved.
//

#import "CustomSizeModalController.h"

@interface CustomSizeModalController()

@property (nonatomic) UICustomTransitionOption option;

@end

@implementation CustomSizeModalController


- (instancetype) initWithPresentedViewController:(UIViewController *)presentedViewController
                        presentingViewController:(UIViewController *)presentingViewController
                                         option:(UICustomTransitionOption)option
                            withHorizontalInsets: (CGFloat) insets
                                      viewHeight: (CGFloat) height
{
    
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    if(self) {
        self.option = option;
        self.horizontalInsets = insets;
        self.viewHeight = height;
        
    }
    return self;
}

#pragma mark - UIPresentationController methods

- (CGRect)frameOfPresentedViewInContainerView {
    CGFloat height = self.containerView.bounds.size.height;
    CGFloat width = self.containerView.bounds.size.width;
    
    if (!height) return CGRectZero;
    if (!width) return CGRectZero;
    
    CGFloat frameHeight = height;
    CGFloat y = 0;

    switch (self.option) {
        case UICustomTransitionCentrallyOption:
            width = width - (self.horizontalInsets * 2);
            frameHeight = self.viewHeight;
            y = height / 2 - (self.viewHeight / 2);
            break;
        case UICustomTransitionFromBottomOption:
            width = width - (self.horizontalInsets * 2);
            frameHeight = self.viewHeight;
            y = height - self.viewHeight - self.horizontalInsets;
            break;
        default:
            return self.containerView.bounds;
            break;
    }
    
    return CGRectMake(self.horizontalInsets, y, width, frameHeight);
}


@end
