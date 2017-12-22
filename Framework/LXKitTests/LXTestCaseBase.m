//
//  LXTestCaseBase.m
//  LXCategoryTests
//
//  Created by 徐良华 on 2017/12/19.
//  Copyright © 2017年 Lyon. All rights reserved.
//

#import "LXTestCaseBase.h"

const NSTimeInterval kAsyncTestTimeout = 5;

@implementation LXTestCaseBase

- (void)waitForExpectationsWithCommonTimeout {
    [self waitForExpectationsWithCommonTimeoutUsingHandler:nil];
}

- (void)waitForExpectationsWithCommonTimeoutUsingHandler:(XCWaitCompletionHandler)handler {
    [self waitForExpectationsWithTimeout:kAsyncTestTimeout handler:handler];
}

@end
