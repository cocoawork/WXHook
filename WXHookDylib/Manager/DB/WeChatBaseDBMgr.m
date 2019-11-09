//
// DatabaseManager.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/27
// Time: 09:55
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "WeChatBaseDBMgr.h"
#import "NSString+MD5.h"

@interface WeChatBaseDBMgr ()

@property(nonatomic, copy)NSString *account;

@end

@implementation WeChatBaseDBMgr


+ (instancetype)curretnAccountDBManager
{
    AccountStorageMgr *accountMgr = [WeChatServiceManager accountManager];
    NSString *account = accountMgr.m_oLocalInfo.m_nsLastUserName;
    return [[self alloc] initWithAccount:account];
}

- (instancetype)initWithAccount:(NSString *)account
{
    if (self = [super init]) {
        self.account = account;
        _db = [FMDatabase databaseWithPath:[self dbPath]];
    }
    return self;
}


- (NSString *)databaseName
{
    return @"";
}


- (NSString *)dbPath
{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
                      stringByAppendingFormat:@"/%@/DB/%@", [self.account MD5], [self databaseName]];
    return path;
}


@end
