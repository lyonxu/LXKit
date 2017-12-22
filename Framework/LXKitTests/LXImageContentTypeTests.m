//
//  LXImageContentTypeTests.m
//  LXKitTests
//
//  Created by 徐良华 on 2017/12/20.
//  Copyright © 2017年 Lyon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LXKit.h"
#import "LXTestCaseBase.h"

@interface LXImageContentTypeTests : LXTestCaseBase

@end

@implementation LXImageContentTypeTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test01WithJPGImage {
    NSString *testImagePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestImage" ofType:@"jpg"];
    NSData *imageData = [NSData dataWithContentsOfFile:testImagePath];
    LXImageFormat imageFormat = [NSData lx_imageFormatForImageData:imageData];
    XCTAssertEqual(imageFormat, LXImageFormatJPEG);
}

- (void)test02WithPNGImage {
    NSString *testImagePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestImage" ofType:@"png"];
    NSData *imageData = [NSData dataWithContentsOfFile:testImagePath];
    LXImageFormat imageFormat = [NSData lx_imageFormatForImageData:imageData];
    XCTAssertEqual(imageFormat, LXImageFormatPNG);
}

- (void)test03WithGIFImage {
    NSString *testImagePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestImage" ofType:@"gif"];
    NSData *imageData = [NSData dataWithContentsOfFile:testImagePath];
    LXImageFormat imageFormat = [NSData lx_imageFormatForImageData:imageData];
    XCTAssertEqual(imageFormat, LXImageFormatGIF);
}

- (void)test04WithAnimatedWEBPImage {
    NSString *testImagePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestImageAnimated" ofType:@"webp"];
    NSData *imageData = [NSData dataWithContentsOfFile:testImagePath];
    LXImageFormat imageFormat = [NSData lx_imageFormatForImageData:imageData];
    XCTAssertEqual(imageFormat, LXImageFormatWebP);
}

- (void)test05WithStaticWEBPImage {
    NSString *testImagePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestImageStatic" ofType:@"webp"];
    NSData *imageData = [NSData dataWithContentsOfFile:testImagePath];
    LXImageFormat imageFormat = [NSData lx_imageFormatForImageData:imageData];
    XCTAssertEqual(imageFormat, LXImageFormatWebP);
}

@end
