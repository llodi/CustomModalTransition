//
//  DimmingView.m
//  Alamofire
//
//  Created by osinit on 03.06.2018.
//

#import "DimmingView.h"

@interface DimmingView ()

@property (nonatomic) Boolean enabledTap;

@end

@implementation DimmingView

- (instancetype) initWithBackgroundColor: (UIColor *) color dimmingAlpha: (CGFloat) alpha enabledTap: (Boolean) enabled {
    
    self = [super initWithFrame: CGRectZero];
    
    if (self) {
        self.backgroundColor = color;
        self.dimmingAlpha = alpha;
        [self setAlpha: alpha];
        self.enabledTap = enabled;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        if (enabled) {
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
            [self addGestureRecognizer:recognizer];
        }
    }
    
    return self;
}

- (void) handleTap: (UITapGestureRecognizer *) recognizer {
    if (self.onBackgroundView) {
        self.onBackgroundView();
    }
}

@end
