//
//  BuglyMender.h
//
//  Copyright (c) 2017年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

//补丁事件
typedef NS_ENUM(NSUInteger, BuglyHotfixEvent) {
    //补丁状态正常
    BuglyHotfixEventPatchValid,
    //新补丁
    BuglyHotfixEventNewPatch,
    //撤回补丁
    BuglyHotfixEventRevertPatch
};

//补丁状态
typedef NS_ENUM(NSUInteger, BuglyHotfixPatchStatus) {
    //补丁安装成功
    BuglyHotfixPatchStatusInstallSucess,
    //补丁安装失败
    BuglyHotfixPatchStatusInstallFail,
    //补丁激活成功
    BuglyHotfixPatchStatusActiveSucess,
    //补丁激活失败
    BuglyHotfixPatchStatusActiveFail,
    //补丁撤回成功
    BuglyHotfixPatchStatusRevertSucess,
    //补丁撤回失败
    BuglyHotfixPatchStatusRevertFail
};
/*
 Patch Info 示例
 patchDesc 为 补丁备注
 patchDirectory 为 补丁本地路径
 patchUpdateTime 为 补丁更新时间戳
 patchVersion 为补丁版本
 
 {
 patchDesc = "description";
 patchDirectory = ".../main.js";
 patchUpdateTime = 1493889062000;
 patchVersion = 1;
 }
 */
typedef void(^HotfixEventHandler)(BuglyHotfixEvent event, NSDictionary *patchInfo);

@interface BuglyMender : NSObject

+ (instancetype)sharedMender;

/**
 查询补丁目录路径
 
 @return 补丁根目录路径
 */
- (NSString *)patchDirectory;

/**
 上报补丁应用状态
 
 @param status 补丁状态
 */
- (void)reportPatchStatus:(BuglyHotfixPatchStatus)status;

/**
 检测补丁配置
 
 @param handler 补丁事件处理
 */
- (void)checkRemoteConfigWithEventHandler:(HotfixEventHandler)handler;

/**
 清除本地补丁文件及配置
 
 */
- (void)invalidPatch;

/**
 查询SDK版本号
 
 @return 版本号
 */
+ (NSString *)hotfixSDKVersion;

/**
 当前补丁信息
 
 @return 补丁信息，详情查看 PatchInfo 示例
 */
- (NSDictionary *)currentPatchInfo;

@end
