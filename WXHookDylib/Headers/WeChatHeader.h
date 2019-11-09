//
// WeChatHeader.h @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/26
// Time: 15:15
//
// Copyright © 2019 cocoawork. All rights reserved.

#ifndef WeChatHeader_h
#define WeChatHeader_h

#import <UIKit/UIKit.h>

@interface WCChatRoomStoryDataVM

@property(copy, nonatomic) NSArray *chatRoomMemberArray;

@end

@interface CGroupMgr

@end


@interface WCGroupMgr
- (id)getAllGroups;
@end

@interface WCGroup : NSObject <NSCoding>

@property(retain, nonatomic) NSMutableArray *memberList; // @synthesize memberList;
@property(retain, nonatomic) NSString *name; // @synthesize name;
@property(retain, nonatomic) NSString *gid; // @synthesize gid;

@end


@interface MMServiceCenter

- (id)getService:(Class) name;

@end


@interface CLocalInfo

@property(nonatomic) _Bool m_isAreadyChangeWeChatFontSetting; // @synthesize m_isAreadyChangeWeChatFontSetting;
@property(nonatomic) _Bool m_isAreadyShowFontSettingTips; // @synthesize m_isAreadyShowFontSettingTips;
@property(retain, nonatomic) NSString *m_nsSystemContentSize; // @synthesize m_nsSystemContentSize;
@property(copy, nonatomic) NSString *m_nsLastPhoneNumber; // @synthesize m_nsLastPhoneNumber;
@property(nonatomic) unsigned int m_uiNetControlBitFlag; // @synthesize m_uiNetControlBitFlag;
@property(nonatomic) unsigned int m_uiWebviewFontLevel; // @synthesize m_uiWebviewFontLevel;
@property(nonatomic) unsigned int m_uiGlobalFontLevel; // @synthesize m_uiGlobalFontLevel;
@property(nonatomic) unsigned int m_uiFontLevel; // @synthesize m_uiFontLevel;
@property(nonatomic) _Bool m_bIsOpenVoicePrint; // @synthesize m_bIsOpenVoicePrint;
@property(nonatomic) _Bool m_isAreadyLoginByIphone6Or6P; // @synthesize m_isAreadyLoginByIphone6Or6P;
@property(nonatomic) _Bool m_IsShowChooseVC; // @synthesize m_IsShowChooseVC;
@property(nonatomic) _Bool m_IsLoadOldSet; // @synthesize m_IsLoadOldSet;
@property(nonatomic) _Bool m_IsIpadClassic; // @synthesize m_IsIpadClassic;
@property(nonatomic) _Bool m_bIsAuthPushLoginURL; // @synthesize m_bIsAuthPushLoginURL;
@property(nonatomic) _Bool m_bHasShowChooseView; // @synthesize m_bHasShowChooseView;
@property(retain, nonatomic) NSString *m_nsPushLoginURLTips; // @synthesize m_nsPushLoginURLTips;
@property(retain, nonatomic) NSData *m_nsLastSvrID; // @synthesize m_nsLastSvrID;
@property(nonatomic) unsigned int m_uiLastLoginAcountType; // @synthesize m_uiLastLoginAcountType;
@property(nonatomic) unsigned int m_uiBindAcountFlag; // @synthesize m_uiBindAcountFlag;
@property(nonatomic) unsigned int m_uiRegType; // @synthesize m_uiRegType;
@property(retain, nonatomic) NSData *m_dtLastKSid; // @synthesize m_dtLastKSid;
@property(retain, nonatomic) NSData *m_dtAutoAuthKey; // @synthesize m_dtAutoAuthKey;
@property(nonatomic) unsigned int m_uiLastUin; // @synthesize m_uiLastUin;
@property(retain, nonatomic) NSString *m_nsLastApnsToken; // @synthesize m_nsLastApnsToken;
@property(retain, nonatomic) NSString *m_nsLastNickName; // @synthesize m_nsLastNickName;
@property(retain, nonatomic) NSString *m_nsLastLoginName; // @synthesize m_nsLastLoginName;
@property(retain, nonatomic) NSString *m_nsLastUserName; // @synthesize m_nsLastUserName;
@property(retain, nonatomic) NSString *m_nsCurUsrName; // @synthesize m_nsCurUsrName;

@end


@interface AccountStorageMgr

@property(copy, nonatomic) CLocalInfo *m_oLocalInfo; // @synthesize m_oLocalInfo;

@end



@interface CContact

+ (id)getChatRoomMember:(id)arg1;

@end

@interface MMSessionInfo

@property(retain, nonatomic) CContact *m_contact; // @synthesize m_contact;

@end


@interface MainFrameCellData
@property(retain, nonatomic) MMSessionInfo *m_sessionInfo; // @synthesize m_sessionInfo;
@end


@interface NewMainFrameCell
@property(retain, nonatomic) MainFrameCellData *m_oldCellData; // @synthesize m_oldCellData;
@property(retain, nonatomic) MainFrameCellData *m_cellData; // @synthesiz
@end


@interface WCAccountLoginLastUserViewController

@property(nonatomic, strong)UIView *view;

@end


@interface MicroMessengerAppDelegate

@property(nonatomic, strong)UIWindow *hookWindow;

@end


#endif /* WeChatHeader_h */
