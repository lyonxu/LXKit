//
//  LXTestCaseBase.h
//  LXCategoryTests
//
//  Created by 徐良华 on 2017/12/19.
//  Copyright © 2017年 Lyon. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface LXTestCaseBase : XCTestCase

- (void)waitForExpectationsWithCommonTimeout;
- (void)waitForExpectationsWithCommonTimeoutUsingHandler:(nullable XCWaitCompletionHandler)handler;

@end
