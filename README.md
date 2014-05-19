GestureImageView
============

GestureImageView is a subclass of UIImageView. It extendeds gesture function by `- (void)addTarget:(id)target action:(SEL)action forGestureRecognizer:(UIGestureRecognizer* )recognizer` .
PS: Now it only can add the system-provided [GestureRecognizer][1].

**A GestureImageView now has only one target-action pair with it.** Recognition of a GestureImageView results in the dispatch of an action message to a target for the associated pair. **The action methods invoked must conform to one of the following signatures:**
```Obj-c
- (void)handleGestureImageView;
- (void)handleGestureImageView:(GestureImageView *)imgaeView;
- (void)handleGestureImageView:(GestureImageView *)imgaeView gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer;
```

GestureImageView can help you easily to get an imageView with Tap Event/Click Event, or LongPress Event and so on. The code snippet below will show you how to get a TapImageView, LongPressImageView, PinchImageView:
PS: to get more details, please see the demo.

**TapImageView**
```Obj-c
    //TapImageView
    GestureImageView *tapImageView = [[GestureImageView alloc] initWithFrame:CGRectMake(5, 30, 80, 80)];
    tapImageView.backgroundColor = [UIColor greenColor];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    tapGestureRecognizer.numberOfTapsRequired = 1;
    
    [tapImageView addTarget:self action:@selector(handleGestureImageView) forGestureRecognizer:tapGestureRecognizer];
    
    //You can also use the category method in "GestureImageView+Tap.h" 
    //to get a TapImageView 
    GestureImageView *tapImageView2 = [[GestureImageView alloc] initWithFrame:CGRectMake(95, 30, 80, 80)];
    tapImageView2.backgroundColor = [UIColor yellowColor];
    [tapImageView2 addTarget:self action:@selector(handleGestureImageView) forNumberOfTaps:2];
```
```Obj-c
- (void)handleGestureImageView
{
    NSLog(@"handleGestureImageView ...");
}
```

**LongPressImageView**
```Obj-c
    //LongPressImageView
    GestureImageView *longPressImageView = [[GestureImageView alloc] initWithFrame:CGRectMake(185, 30, 80, 80)];
    longPressImageView.backgroundColor = [UIColor blueColor];
    longPressImageView.tag = 1000;
    
    UILongPressGestureRecognizer *longPressGestureRecognizer= [[UILongPressGestureRecognizer alloc] init];
    longPressGestureRecognizer.numberOfTouchesRequired = 1;
    longPressGestureRecognizer.allowableMovement = 40.0f;
    longPressGestureRecognizer.minimumPressDuration = 1.0f;
    
    [longPressImageView addTarget:self action:@selector(handleGestureImageView:) forGestureRecognizer:longPressGestureRecognizer];
```
```Obj-c
- (void)handleGestureImageView:(GestureImageView *)imgaeView
{
    NSLog(@"the GestureImageView's tag: %d",imgaeView.tag);
}
```

**PinchImageView**
```Obj-c
    //PinchImageView
    GestureImageView *pinchImageView = [[GestureImageView alloc] initWithFrame:CGRectMake(5, 120, 150, 150)];
    pinchImageView.backgroundColor = [UIColor redColor];
    pinchImageView.tag = 1001;
    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] init];
    
    [pinchImageView addTarget:self action:@selector(handleGestureImageView:gestureRecognizer:) forGestureRecognizer:pinchGestureRecognizer];
```
```Obj-c
- (void)handleGestureImageView:(GestureImageView *)imgaeView gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    if (imgaeView.tag == 1001) {
        UIPinchGestureRecognizer *theRecognizer = (UIPinchGestureRecognizer *)gestureRecognizer;
        imgaeView.transform = CGAffineTransformScale(imgaeView.transform,theRecognizer.scale, theRecognizer.scale);
        theRecognizer.scale = 1;
    }
}
```



  [1]: https://developer.apple.com/Library/ios/documentation/UIKit/Reference/UIGestureRecognizer_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40009279-CH1-DontLinkElementID_1