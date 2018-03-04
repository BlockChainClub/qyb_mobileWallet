/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

//
//  AppDelegate.m
//  QYB
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import <Bugly/Bugly.h>

#import <PgyUpdate/PgyUpdateManager.h>

@interface AppDelegate ()<BuglyDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    //bugly
//    [self configBugly];
    [Bugly startWithAppId:@"900054200"];
    
    self.viewController = [[MainViewController alloc] init];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    //启动更新检查SDK
    [[PgyUpdateManager sharedPgyManager] startManagerWithAppId:@"e8f6ca171babff510f6e483fa9656cc8"];
    [[PgyUpdateManager sharedPgyManager] checkUpdate];
    
    
}

//- (void)configBugly {
//    //初始化 Bugly 异常上报
//    BuglyConfig *config = [[BuglyConfig alloc] init];
//    config.delegate = self;
//    config.debugMode = YES;
//    config.reportLogLevel = BuglyLogLevelInfo;
//    [Bugly startWithAppId:@"900054200"
//#if DEBUG
//        developmentDevice:YES
//#endif
//                   config:config];
//
//    //捕获 JSPatch 异常并上报
//    [JPEngine handleException:^(NSString *msg) {
//        NSException *jspatchException = [NSException exceptionWithName:@"Hotfix Exception" reason:msg userInfo:nil];
//        [Bugly reportException:jspatchException];
//    }];
//    //检测补丁策略
//    [[BuglyMender sharedMender] checkRemoteConfigWithEventHandler:^(BuglyHotfixEvent event, NSDictionary *patchInfo) {
//        //有新补丁或本地补丁状态正常
//        if (event == BuglyHotfixEventPatchValid || event == BuglyHotfixEventNewPatch) {
//            //获取本地补丁路径
//            NSString *patchDirectory = [[BuglyMender sharedMender] patchDirectory];
//            if (patchDirectory) {
//                //指定执行的 js 脚本文件名
//                NSString *patchFileName = @"main.js";
//                NSString *patchFile = [patchDirectory stringByAppendingPathComponent:patchFileName];
//                //执行补丁加载并上报激活状态
//                if ([[NSFileManager defaultManager] fileExistsAtPath:patchFile] &&
//                    [JPEngine evaluateScriptWithPath:patchFile] != nil) {
//                    BLYLogInfo(@"evaluateScript success");
//                    [[BuglyMender sharedMender] reportPatchStatus:BuglyHotfixPatchStatusActiveSucess];
//                }else {
//                    BLYLogInfo(@"evaluateScript failed");
//                    [[BuglyMender sharedMender] reportPatchStatus:BuglyHotfixPatchStatusActiveFail];
//                }
//            }
//        }
//    }];
//}



@end
