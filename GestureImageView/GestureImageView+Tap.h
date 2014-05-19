//
//  GestureImageView+Tap.h
//  GestureImageViewDemo
//
//  Created by zhang zhiyu on 14-5-19.
//  Copyright (c) 2014年 YK-Unit. All rights reserved.
//

#import "GestureImageView.h"

@interface GestureImageView (Tap)

// The number of touches is 1. 
- (void)addTarget:(id)target action:(SEL)action forNumberOfTaps:(NSInteger)taps;

- (void)addTarget:(id)target action:(SEL)action forNumberOfTaps:(NSInteger)taps numberOfTouches:(NSInteger)touches;

@end
