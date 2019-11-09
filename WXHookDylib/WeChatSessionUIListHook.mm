//
// WeChatSessionUIListHook.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/26
// Time: 15:11
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "WXHookDylib.h"
#import <objc-runtime.h>
#import "WeChatServiceManager.h"

//聊天界面
CHDeclareClass(BaseMsgContentViewController)


CHOptimizedMethod0(self, void, BaseMsgContentViewController, viewDidLoad){
    CHSuper0(BaseMsgContentViewController, viewDidLoad);
    WCChatRoomStoryDataVM *data = CHIvar(self, _storyDataVM, __strong WCChatRoomStoryDataVM *);
    NSLog(@"%@", data.chatRoomMemberArray);
    
//    id controller = [UIApplication sharedApplication].keyWindow.rootViewController;
//    if([controller isKindOfClass:[UITabBarController class]]) {
//        NSArray *cs = [(UITabBarController*)controller viewControllers];
//        for(UINavigationController *c in cs) {
//            NSLog(@"%@", [c viewControllers]);
//        }
//    }

}


//首页会话
CHDeclareClass(NewMainFrameViewController)

//CHOptimizedMethod1(self, void, NewMainFrameViewController, viewDidAppear, BOOL, animated){
//
//
//    CGroupMgr *groupManager = [WeChatServiceManager groupManager];
//
////    NSArray<WCGroup*> *groups = [groupManager getAllGroups];
//
//    AccountStorageMgr *accountMgr = [WeChatServiceManager accountManager];
//
//
//
//}


CHOptimizedMethod2(self, void, NewMainFrameViewController, tableView, UITableView *, tableView, didSelectRowAtIndexPath, NSIndexPath *, indexpath){
    CHSuper2(NewMainFrameViewController, tableView, tableView, didSelectRowAtIndexPath, indexpath);
    NewMainFrameCell *cell = (NewMainFrameCell *)[tableView cellForRowAtIndexPath:indexpath];
    MainFrameCellData *celldata = cell.m_cellData;
    MMSessionInfo *sessionInfo = celldata.m_sessionInfo;
    CContact *contact = sessionInfo.m_contact;
    NSLog(@"%@", contact);
}



CHConstructor{
    CHLoadLateClass(BaseMsgContentViewController);
    CHHook0(BaseMsgContentViewController, viewDidLoad);
    
    CHLoadLateClass(NewMainFrameViewController);
    CHHook2(NewMainFrameViewController, tableView, didSelectRowAtIndexPath);

    
}
