//
// WeChatAppDelegateHook.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/26
// Time: 20:53
//
// Copyright © 2019 cocoawork. All rights reserved.

#import <Foundation/Foundation.h>
#import "WXHookDylib.h"
#import <objc-runtime.h>
#import "NSString+MD5.h"
#import "EasyNavigation/EasyNavigation.h"
#import "EasyNavigation/EasyNavigationOptions.h"
#import "HookRootViewController.h"
#import "HookBlankViewController.h"

CHDeclareClass(MicroMessengerAppDelegate)

CHPropertyRetainNonatomic(MicroMessengerAppDelegate, UIWindow*, hookWindow, setHookWindow);


CHOptimizedMethod2(self, BOOL, MicroMessengerAppDelegate, application, UIApplication *, application, didFinishLaunchingWithOptions, NSDictionary *, options) {
    CHSuper2(MicroMessengerAppDelegate, application, application, didFinishLaunchingWithOptions, options);
    
    
    
    
//    AccountStorageMgr *accountMgr = [WeChatServiceManager accountManager];
//    if (accountMgr.m_oLocalInfo.m_nsLastLoginName.length == 0) {
//        [[[UIAlertView alloc] initWithTitle:@"提示:"
//                                    message:@"当前未登录状态, 请登录后重新启动应用"
//                                   delegate:nil
//                          cancelButtonTitle:@"登录"
//                          otherButtonTitles:nil, nil] show];
//    }else {
        WXHookWindow *window = [WXHookWindow defaultHookWindow];
        
        EasyNavigationOptions *opt = [EasyNavigationOptions shareInstance];
        opt.titleColor = [UIColor whiteColor];
        opt.navBackGroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        opt.backGroundAlpha = 1;
        opt.titleFont = [UIFont boldSystemFontOfSize:16];
        opt.buttonTitleColor = [UIColor whiteColor];
        
        EasyNavigationController *naviVC = [[EasyNavigationController alloc] initWithRootViewController:[HookRootViewController new]];
        window.rootViewController = naviVC;
        window.clipsToBounds = YES;
//    }
    
    return YES;
}

//CHDeclareClass(WCAccountLoginLastUserViewController)
//
//CHOptimizedMethod0(self, void, WCAccountLoginLastUserViewController, viewDidLoad) {
//    CHSuper0(WCAccountLoginLastUserViewController, viewDidLoad);
//    UIWindow *keyWindow = CHIvar([UIApplication sharedApplication].delegate, m_resourceWindow, __strong UIWindow *);
//    WXHookFloatRootView *rootView = [WXHookFloatRootView hookFloatView];
//    [self.view addSubview:rootView];
//    [self.view  bringSubviewToFront:rootView];
//
//    WXHookHomeControllerView *vc = [[WXHookHomeControllerView alloc] initWithFrame:CGRectMake(10, 10, 100, 200)];
//    [rootView setRootControllerView:vc];
//}


CHConstructor{
    CHLoadLateClass(MicroMessengerAppDelegate);
    CHHook0(MicroMessengerAppDelegate, hookWindow);
    CHHook1(MicroMessengerAppDelegate, setHookWindow);
    CHHook2(MicroMessengerAppDelegate, application, didFinishLaunchingWithOptions);
//
//    CHLoadLateClass(WCAccountLoginLastUserViewController);
//    CHHook0(WCAccountLoginLastUserViewController, viewDidLoad);
}
