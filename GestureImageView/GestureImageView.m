//
//  GestureImageView.m
//  GestureImageViewDemo
//
//  Created by zhang zhiyu on 14-5-19.
//  Copyright (c) 2014年 YK-Unit. All rights reserved.
//

#import "GestureImageView.h"
#import <objc/message.h>

@interface GestureImageView()
@property (nonatomic,assign) id target;
@property (nonatomic,assign) SEL action;
@property (nonatomic,strong) UIGestureRecognizer *gestureRecognizer;

- (void)handleGestureRecognizer:(UIGestureRecognizer *)recognizer;

@end

@implementation GestureImageView
@synthesize target,action;
@synthesize gestureRecognizer;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)addTarget:(id)tar action:(SEL)act forGestureRecognizer:(UIGestureRecognizer *)recognizer
{
    self.userInteractionEnabled = YES;

    if (self.gestureRecognizer) {
        [self removeGestureRecognizer:self.gestureRecognizer];
        self.gestureRecognizer = nil;
    }
    
    if (!tar || !act || !recognizer) {
        return;
    }
    
    self.target = tar;
    self.action = act;
    
    if ([recognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        UITapGestureRecognizer *theRecognizer = (UITapGestureRecognizer *)recognizer;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
        
        tapGestureRecognizer.numberOfTouchesRequired = theRecognizer.numberOfTouchesRequired;
        tapGestureRecognizer.numberOfTapsRequired = theRecognizer.numberOfTapsRequired;
        
        self.gestureRecognizer = tapGestureRecognizer;
        
    }else if ([recognizer isKindOfClass:[UILongPressGestureRecognizer class]]){
        UILongPressGestureRecognizer *theRecognizer = (UILongPressGestureRecognizer *)recognizer;
        UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
        
        longPressGestureRecognizer.minimumPressDuration = theRecognizer.minimumPressDuration;
        longPressGestureRecognizer.numberOfTouchesRequired = theRecognizer.numberOfTouchesRequired;
        longPressGestureRecognizer.numberOfTapsRequired = theRecognizer.numberOfTapsRequired;
        longPressGestureRecognizer.allowableMovement = theRecognizer.allowableMovement;
        
        self.gestureRecognizer = longPressGestureRecognizer;
        
    }else if ([recognizer isKindOfClass:[UIPinchGestureRecognizer class]]){
        UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
        
        self.gestureRecognizer = pinchGestureRecognizer;
        
    }else if ([recognizer isKindOfClass:[UIRotationGestureRecognizer class]]){
        UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
        
        self.gestureRecognizer = rotationGestureRecognizer;
        
    }else if ([recognizer isKindOfClass:[UISwipeGestureRecognizer class]]){
        UISwipeGestureRecognizer *theRecognizer = (UISwipeGestureRecognizer *)recognizer;
        UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
        
        swipeGestureRecognizer.direction = theRecognizer.direction;
        swipeGestureRecognizer.numberOfTouchesRequired = theRecognizer.numberOfTouchesRequired;
        
        self.gestureRecognizer = swipeGestureRecognizer;
        
    }else if ([recognizer isKindOfClass:[UIPanGestureRecognizer class]]){
        UIPanGestureRecognizer *theRecognizer = (UIPanGestureRecognizer *)recognizer;
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
        
        panGestureRecognizer.maximumNumberOfTouches = theRecognizer.maximumNumberOfTouches;
        panGestureRecognizer.minimumNumberOfTouches = theRecognizer.minimumNumberOfTouches;
        
        self.gestureRecognizer = panGestureRecognizer;
        
    }else if ([recognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]){
        UIScreenEdgePanGestureRecognizer *theRecognizer = (UIScreenEdgePanGestureRecognizer *)recognizer;
        UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
        
        screenEdgePanGestureRecognizer.edges = theRecognizer.edges;
        
        self.gestureRecognizer = screenEdgePanGestureRecognizer;
        
    }else{
        self.gestureRecognizer = nil;
    }
    
    self.gestureRecognizer.delegate = recognizer.delegate;
    self.gestureRecognizer.enabled = recognizer.enabled;
    
    [self addGestureRecognizer:self.gestureRecognizer];
}

- (void)handleGestureRecognizer:(UIGestureRecognizer *)recognizer
{
    if (self.target && self.action) {
        if ([self.target respondsToSelector:self.action]) {
            objc_msgSend(self.target, self.action, self,recognizer);
        }
    }
}
@end
