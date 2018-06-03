//
//  UICustomTransitionOption.h
//  Thermostat
//
//  Created by Ilya Dolgopolov on 28.04.17.
//  Copyright © 2017 redmadrobot. All rights reserved.
//

#ifndef UICustomTransitionOption_h
#define UICustomTransitionOption_h

typedef void (^TapOnBackgroundViewHandler) (void);

typedef NS_ENUM(NSUInteger, UICustomTransitionOption) {
    UICustomTransitionOptionBottom,
    UICustomTransitionOptionCenter
};

#endif /* UICustomTransitionOption_h */
