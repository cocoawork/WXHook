//
// WXHookWindow.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/9/10
// Time: 09:21
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "WXHookWindow.h"

@interface WXHookWindow ()<UIGestureRecognizerDelegate>

@property(nonatomic, assign)BOOL isExpand;
@property(nonatomic, assign)CGFloat offsetX, offsetY;

@property(nonatomic, strong)UIImageView *borderImgView;

@end

@implementation WXHookWindow

+ (instancetype)defaultHookWindow
{
    static WXHookWindow *defaultWindow = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGRect bounds = [UIScreen mainScreen].bounds;
        CGFloat width = [GlobalConfig shareInstance].floatWindowBounds.size.width;
        CGFloat height = [GlobalConfig shareInstance].floatWindowBounds.size.height;
        CGFloat x = bounds.size.width - width;
        CGFloat y = (bounds.size.height - height)/2.f;
        defaultWindow = [[self alloc] initWithFrame:CGRectMake(x, y, width, height)];
    });
    return defaultWindow;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.bounds];
//        imgView.contentMode = UIViewContentModeScaleAspectFill;
//        imgView.backgroundColor = [UIColor clearColor];
//        imgView.userInteractionEnabled = YES;
//        imgView.image = HookBundleImage(@"hook_background", @"png");
//        [self addSubview:imgView];
//        self.borderImgView = imgView;
        
        
        
        self.windowLevel = UIWindowLevelStatusBar;
        self.hidden = NO;
        
        self.layer.borderWidth = 10.f;
        self.layer.borderColor = [UIColor darkGrayColor].CGColor;
        self.layer.cornerRadius = 4.f;
        
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(autoExpand)];
//        ges.delegate = self;
        ges.numberOfTapsRequired = 2;
        [self addGestureRecognizer:ges];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:pan];
        
        
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self setAutoresizesSubviews:YES];
        
        
        self.isExpand = YES;

    }
    return self;
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    if ([touch.view isDescendantOfView:self]) {
//
//        return NO;
//    }
//
//    return YES;
//}


#pragma mark - 手势 拖动

- (void)pan:(UIPanGestureRecognizer *)pan
{
    id delegate = [UIApplication sharedApplication].delegate;
    UIWindow *keyWindow = [(id)delegate valueForKey:@"window"];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [pan locationInView:keyWindow];
        CGPoint center = self.center;
        _offsetX = point.x - center.x;
        _offsetY = point.y - center.y;
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        CGSize size = self.frame.size;
        CGFloat height = size.height;
        CGFloat width = size.width;
        
        CGFloat superWidth = keyWindow.frame.size.width;
        CGFloat superHeight = keyWindow.frame.size.height;
        
        CGPoint point = [pan locationInView:keyWindow];
        
        self.center = CGPointMake(point.x - _offsetX, point.y - _offsetY);
        
        //获取在屏幕中的位置,用于判断是否超出屏幕
        CGRect superRect = [self convertRect:self.bounds toView:keyWindow];
        CGPoint movePoint = CGPointMake(superRect.origin.x + superRect.size.width / 2, superRect.origin.y + superRect.size.height / 2);
        
        //边界限制
        if (movePoint.x < width / 2) {
            movePoint.x = width / 2;
            self.center = movePoint;
        }
        if (movePoint.x > superWidth - width / 2) {
            movePoint.x = superWidth - width / 2;
            self.center = movePoint;
        }
        if (movePoint.y > superHeight - height / 2) {
            movePoint.y = superHeight - height / 2;
            self.center = movePoint;
        }
        if (movePoint.y < height / 2) {
            movePoint.y = height / 2;
            self.center = movePoint;
        }
    }else if (pan.state == UIGestureRecognizerStateFailed || pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded) {
        _offsetY = 0;
        _offsetX = 0;
        CGFloat superWidth = keyWindow.frame.size.width;
        CGPoint point = self.center;
        CGFloat width = self.frame.size.width;
        if (point.x > superWidth / 2) {
            [self moveToPoint:CGPointMake(superWidth - width / 2, point.y) animted:YES];
        }else {
            [self moveToPoint:CGPointMake(width / 2, point.y) animted:YES];
        }
    }
}

- (void)autoExpand
{
    [self setViewExpand:!self.isExpand];
}

- (void)setViewExpand:(BOOL)expand
{
    
    CGFloat duration = 0.2f;
    CGRect rect = self.isExpand ? [self minRect] : [self maxRect];
    [UIView transitionWithView:self
                      duration:duration
                       options:UIViewAnimationOptionCurveLinear
                    animations:^{
                        self.frame = rect;
                    } completion:^(BOOL finished) {
                        self.isExpand = expand;
                        if (self.isExpand) {
                            self.layer.opacity = 1;
                        }else {
                            self.layer.opacity = 0.3;
                        }
                    }];
}

- (void)moveToPoint:(CGPoint)point animted:(BOOL)animted
{
    [UIView transitionWithView:self
                      duration:animted ? 0.1 : 0
                       options:UIViewAnimationOptionCurveEaseOut
                    animations:^{
                        self.center = point;
                    } completion:nil];
}



- (CGRect)maxRect {
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat width = [GlobalConfig shareInstance].floatWindowBounds.size.width;
    CGFloat height = [GlobalConfig shareInstance].floatWindowBounds.size.height;
    CGFloat x = bounds.size.width - width;
    //    CGFloat y = (bounds.size.height - height)/2.f;
    CGFloat y = self.frame.origin.y;
    return CGRectMake(x, y, width, height);
}

- (CGRect)minRect {
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat width = 40;
    CGFloat height = 60;
    CGFloat x = bounds.size.width - 40;
    //    CGFloat y = [self maxRect].origin.y;
    CGFloat y = self.frame.origin.y;
    return CGRectMake(x, y, width, height);
}

@end
