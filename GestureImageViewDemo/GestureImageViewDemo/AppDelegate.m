//
//  AppDelegate.m
//  GestureImageViewDemo
//
//  Created by zhang zhiyu on 14-5-19.
//  Copyright (c) 2014年 YK-Unit. All rights reserved.
//

#import "AppDelegate.h"
#import "GestureImageView.h"
#import "GestureImageView+Tap.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //TapImageView
    GestureImageView *tapImageView = [[GestureImageView alloc] initWithFrame:CGRectMake(5, 30, 80, 80)];
    tapImageView.backgroundColor = [UIColor greenColor];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    tapGestureRecognizer.numberOfTapsRequired = 1;
    
    [tapImageView addTarget:self action:@selector(handleGestureImageView) forGestureRecognizer:tapGestureRecognizer];
    
    [self.window addSubview:tapImageView];
    
    
    
    //TapImageView2
    GestureImageView *tapImageView2 = [[GestureImageView alloc] initWithFrame:CGRectMake(95, 30, 80, 80)];
    tapImageView2.backgroundColor = [UIColor yellowColor];
    tapImageView2.tag = 999;
    
    [tapImageView2 addTarget:self action:@selector(handleGestureImageView:) forNumberOfTaps:2];
    
    [self.window addSubview:tapImageView2];
    
    
    
    //LongPressImageView
    GestureImageView *longPressImageView = [[GestureImageView alloc] initWithFrame:CGRectMake(185, 30, 80, 80)];
    longPressImageView.backgroundColor = [UIColor blueColor];
    longPressImageView.tag = 1000;
    
    UILongPressGestureRecognizer *longPressGestureRecognizer= [[UILongPressGestureRecognizer alloc] init];
    longPressGestureRecognizer.numberOfTouchesRequired = 1;
    longPressGestureRecognizer.allowableMovement = 40.0f;
    longPressGestureRecognizer.minimumPressDuration = 1.0f;
    
    [longPressImageView addTarget:self action:@selector(handleGestureImageView:) forGestureRecognizer:longPressGestureRecognizer];
    
    [self.window addSubview:longPressImageView];
    

    
    //PinchImageView
    GestureImageView *pinchImageView = [[GestureImageView alloc] initWithFrame:CGRectMake(5, 120, 150, 150)];
    pinchImageView.backgroundColor = [UIColor redColor];
    pinchImageView.tag = 1001;
    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] init];
    
    [pinchImageView addTarget:self action:@selector(handleGestureImageView:gestureRecognizer:) forGestureRecognizer:pinchGestureRecognizer];
    
    [self.window addSubview:pinchImageView];
    
    
    //RotationImageView
    GestureImageView *rotationImageView = [[GestureImageView alloc] initWithFrame:CGRectMake(5, 280, 150, 150)];
    rotationImageView.backgroundColor = [UIColor orangeColor];
    rotationImageView.tag = 1002;
    
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] init];
    
    [rotationImageView addTarget:self action:@selector(handleGestureImageView:gestureRecognizer:) forGestureRecognizer:rotationGestureRecognizer];
    
    [self.window addSubview:rotationImageView];
    
    //SwipeImageView
    GestureImageView *swipeImageView = [[GestureImageView alloc] initWithFrame:CGRectMake(160, 120, 150, 150)];
    swipeImageView.backgroundColor = [UIColor purpleColor];
    swipeImageView.tag = 1003;
    
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] init];
    swipeGestureRecognizer.numberOfTouchesRequired = 1;
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [swipeImageView addTarget:self action:@selector(handleGestureImageView:gestureRecognizer:) forGestureRecognizer:swipeGestureRecognizer];
    
    [self.window addSubview:swipeImageView];
    
    //PanImageView
    GestureImageView *panImageView = [[GestureImageView alloc] initWithFrame:CGRectMake(160, 280, 150, 150)];
    panImageView.backgroundColor = [UIColor brownColor];
    panImageView.tag = 1004;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] init];

    [panImageView addTarget:self action:@selector(handleGestureImageView:gestureRecognizer:) forGestureRecognizer:panGestureRecognizer];
    
    [self.window addSubview:panImageView];
    
    return YES;
}

- (void)handleGestureImageView
{
    NSLog(@"handleGestureImageView ...");
}

- (void)handleGestureImageView:(GestureImageView *)imgaeView
{
    NSLog(@"the GestureImageView's tag: %d",imgaeView.tag);
}

- (void)handleGestureImageView:(GestureImageView *)imgaeView gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    if (imgaeView.tag == 1001) {
        UIPinchGestureRecognizer *theRecognizer = (UIPinchGestureRecognizer *)gestureRecognizer;
        imgaeView.transform = CGAffineTransformScale(imgaeView.transform,theRecognizer.scale, theRecognizer.scale);
        theRecognizer.scale = 1;
    }else if (imgaeView.tag == 1002){
        UIRotationGestureRecognizer *theRecognizer = (UIRotationGestureRecognizer *)gestureRecognizer;
        imgaeView.transform = CGAffineTransformRotate(imgaeView.transform, theRecognizer.rotation);
        theRecognizer.rotation = 0;
    }else if (imgaeView.tag == 1003){
        NSLog(@"swipe...");
    }else if (imgaeView.tag == 1004){
        UIPanGestureRecognizer *theRecognizer = (UIPanGestureRecognizer *)gestureRecognizer;
        if (theRecognizer.state != UIGestureRecognizerStateEnded && theRecognizer.state != UIGestureRecognizerStateFailed){
            CGPoint location = [theRecognizer locationInView:theRecognizer.view.superview];
            theRecognizer.view.center = location;
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
