//
// WeChatContactDatabaseMgr.m @ WXHook
// Created by Xcode.
//
// Author: cocoawork
// Date: 2019/8/27
// Time: 16:34
//
// Copyright © 2019 cocoawork. All rights reserved.

#import "WeChatContactDBMgr.h"
#import <Ono/Ono.h>

@implementation WeChatContactDBMgr

+ (instancetype)contactDBMgr
{
    static WeChatContactDBMgr *mgr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mgr = [WeChatContactDBMgr curretnAccountDBManager];
    });
    return mgr;
}

- (NSString *)databaseName
{
    return @"WCDB_Contact.sqlite";
}




- (void)getChatroomByUserName:(NSString *)username{
    if (![self.db isOpen]) {
        [self.db open];
    }
    FMResultSet *result = [self.db executeQuery:@"SELECT * FROM Friend WHERE userName LIKE '%@chatroom%'"];

    while ([result next]) {
        NSString *wxid = [result stringForColumn:@"userName"];
        NSData *d = [result dataForColumn:@"dbcontactheadimage"];
        NSString *headImg = [self blob2StringWithData:d];
        NSData *roomData = [result dataForColumn:@"dbcontactchatroom"];
        NSString *s = [self blob2StringWithData:roomData];
        
        NSString *regex = @"\\<\\bRoomData.*\\<\\/RoomData\\b\\>";
        NSError *error = nil;
        NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:regex
                                                                                    options:0 error:&error];
  
        NSTextCheckingResult *match = [expression firstMatchInString:s options:0 range:NSMakeRange(0, s.length)];
        NSString *roomDataStringResult = nil;
        if (match) {
            roomDataStringResult = [s substringWithRange:match.range];
        }
        if (roomDataStringResult.length > 0) {
            
            ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithString:roomDataStringResult encoding:NSUTF8StringEncoding error:nil];
            NSArray *members = [document.rootElement childrenWithTag:@"Member"];
            
            for (ONOXMLElement *member in members) {
//                NSLog(@"%@", member);
                NSString *wx_id = [[member attributes] valueForKey:@"UserName"];
//                NSString *displayName = [member childrenWithTag:@"DisplayName"].firstObject.stringValue;
                [self getContactByUserName:wx_id];
//                NSLog(@"成员:%@-%@", wx_id, displayName);
            }
        }
        
        NSLog(@"%@", roomData);
        NSLog(@"%@", s);
        NSLog(@"wxid:%@ == 头像:%@", wxid, headImg);
    }
    [self.db close];
}


- (HookContactInfo *)getContactByUserName:(NSString *)username
{
    if (![self.db isOpen]) {
        [self.db open];
    }
    
    FMResultSet *result = [self.db executeQuery:@"SELECT * FROM Friend WHERE userName=?" withArgumentsInArray:@[username]];

    HookContactInfo *contact = [HookContactInfo new];
    while ([result next]) {
        NSString *wxid = [result stringForColumn:@"userName"];
        NSString *headImg = [self blob2StringWithData:[result dataForColumn:@"dbcontactheadimage"]];
        
        contact.wxid = wxid;
        contact.headImgUrl = headImg;
        
        NSString *roomDataString = [self blob2StringWithData:[result dataForColumn:@"dbcontactchatroom"]];
        NSString *regex = @"\\<\\bRoomData.*\\<\\/RoomData\\b\\>";
        NSError *error = nil;
        NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:&error];
        if (!error) {
            NSTextCheckingResult *match = [expression firstMatchInString:roomDataString options:0 range:NSMakeRange(0, roomDataString.length)];
            if (match) {
                NSString *roomDataXML = [roomDataString substringWithRange:match.range];
                if (roomDataXML.length > 0) {
                    NSError *xmlError = nil;
                    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithString:roomDataXML encoding:NSUTF8StringEncoding error:&xmlError];
                    if (!xmlError) {
                        NSArray *members = [document.rootElement childrenWithTag:@"Member"];
                        NSMutableArray *memberArray = [[NSMutableArray alloc] init];
                        for (ONOXMLElement *member in members) {
                            NSString *wx_id = [[member attributes] valueForKey:@"UserName"];
                            HookContactInfo *memberContact = [self getContactByUserName:wx_id];
                            [memberArray addObject:memberContact];
                        }
                        contact.members = [memberArray copy];
                    }
                }
            }
        }
    }
    
    [self.db close];
    return contact;
}


//获取头像
- (NSString *)blob2StringWithData:(NSData *)data{
    if (data.length <= 8) {
        return @"";
    }
    
    int begin = 0;
    int end = 0;
    
    Byte *byteData = (Byte *)[data bytes];
    for(int i=0;i<[data length];i++){
        if (byteData[i] == 104 && begin == 0) {//104 = "h"
            begin = i;
        }
        
        if (byteData[i] == 26 && end == 0) {//26 = "结束"
            end = i;
        }
    }
    
    if (begin > 0 && end > 0) {
        int len = end - begin;
        NSData* tempData = [data subdataWithRange:NSMakeRange(begin, len)];
        NSString* str = [[NSString alloc]initWithData:tempData encoding:NSASCIIStringEncoding];
        return str;
    }
    
    return @"";
}


-(NSArray*)getRemarkDataBy:(NSData *)data{
    Byte *testByte = (Byte *)[data bytes];
    
    NSMutableArray* arr = [[NSMutableArray alloc]init];
    int len = 0;
    int index = 0;
    while (true) {
        index++;
        len = testByte[index];
        index++;
        
        if (index + len > [data length]) {
            break;
        }
        
        NSString* str = [[NSString alloc]initWithData:[data subdataWithRange:NSMakeRange(index, len)] encoding:NSUTF8StringEncoding];
        if (str != nil) {
            [arr addObject:str];
        }
        
        index += len;
    }
    
    return [arr copy];
}


@end
