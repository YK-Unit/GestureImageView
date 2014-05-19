//
//  GestureImageView.h
//  GestureImageViewDemo
//
//  Created by zhang zhiyu on 14-5-19.
//  Copyright (c) 2014年 YK-Unit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureImageView : UIImageView

- (void)addTarget:(id)target action:(SEL)action forGestureRecognizer:(UIGestureRecognizer* )recognizer;

@end
