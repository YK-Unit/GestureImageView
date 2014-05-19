//
//  GestureImageView+Tap.m
//  GestureImageViewDemo
//
//  Created by zhang zhiyu on 14-5-19.
//  Copyright (c) 2014年 YK-Unit. All rights reserved.
//

#import "GestureImageView+Tap.h"

@implementation GestureImageView (Tap)

- (void)addTarget:(id)tar action:(SEL)act forNumberOfTaps:(NSInteger)taps
{
    [self addTarget:tar action:act forNumberOfTaps:taps numberOfTouches:1];
}

- (void)addTarget:(id)tar action:(SEL)act forNumberOfTaps:(NSInteger)taps numberOfTouches:(NSInteger)touches
{
    if (taps < 1) {
        taps = 1;
    }
    
    if (touches < 1) {
        touches = 1;
    }
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
    tapGestureRecognizer.numberOfTouchesRequired = touches;
    tapGestureRecognizer.numberOfTapsRequired = taps;
    
    [self addTarget:tar action:act forGestureRecognizer:tapGestureRecognizer];
}

@end
