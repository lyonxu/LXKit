//
//  LXNSStringLengthTests.m
//  LXKitTests
//
//  Created by 徐良华 on 2017/12/25.
//  Copyright © 2017年 Lyon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LXTestCaseBase.h"
#import "NSString+LXLength.h"

@interface LXNSStringLengthTests : LXTestCaseBase

@end

@implementation LXNSStringLengthTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCharactorNumber {
    
    NSString *testString;

    //nil
    XCTAssertEqual([testString charactorNumber], 0);
    
    //空
    testString = @"";
    XCTAssertEqual([testString charactorNumber], 0);
    
    //中英文混合
    testString = @"测试长度应该=15";
    XCTAssertEqual([testString charactorNumber], 15);
    
    //中文符号，每个符号占2位
    testString = @"~";
    XCTAssertEqual([testString charactorNumber], 1);
    
    testString = @"！";
    XCTAssertEqual([testString charactorNumber], 2);
    
    testString = @"@";
    XCTAssertEqual([testString charactorNumber], 1);
    
    testString = @"#";
    XCTAssertEqual([testString charactorNumber], 1);
    
    testString = @"￥";
    XCTAssertEqual([testString charactorNumber], 2);
    
    testString = @"%";
    XCTAssertEqual([testString charactorNumber], 1);
    
    testString = @"&";
    XCTAssertEqual([testString charactorNumber], 1);
    
    testString = @"*";
    XCTAssertEqual([testString charactorNumber], 1);
    
    testString = @"（）";
    XCTAssertEqual([testString charactorNumber], 4);
    
    testString = @"——";
    XCTAssertEqual([testString charactorNumber], 4);
    
    //英文符号
    testString = @"~!@#$%&*()长度=17";
    XCTAssertEqual([testString charactorNumber], 17);
}
- (void)testCharactorNumberForChineseSpecial {
    
    NSString *testString;
    
    //nil
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 0);
    
    //空
    testString = @"";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 0);
    
    //中英文混合
    testString = @"测试长度应该=15";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 15);
    
    //中文符号，每个符号占2位
    testString = @"~";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 1);
    
    testString = @"！";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 1);
    
    testString = @"@";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 1);
    
    testString = @"#";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 1);
    
    testString = @"￥";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 1);
    
    testString = @"%";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 1);
    
    testString = @"&";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 1);
    
    testString = @"*";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 1);
    
    testString = @"（）";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 2);
    
    testString = @"——";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 2);
    
    //英文符号
    testString = @"~!@#$%&*()长度=17";
    XCTAssertEqual([testString charactorNumberForChineseSpecial], 17);
}

@end
