//
//  DimmingView.h
//  Alamofire
//
//  Created by osinit on 03.06.2018.
//

#import <UIKit/UIKit.h>
#import "UICustomTransitionOption.h"

@interface DimmingView : UIView

@property (nonatomic) CGFloat dimmingAlpha;
@property (nonatomic) TapOnBackgroundViewHandler  onBackgroundView;

- (instancetype) initWithBackgroundColor: (UIColor *) color dimmingAlpha: (CGFloat) alpha enabledTap: (Boolean) enabled;
@end
