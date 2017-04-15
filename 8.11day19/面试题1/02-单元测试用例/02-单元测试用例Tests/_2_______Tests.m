//
//  _2_______Tests.m
//  02-单元测试用例Tests
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Cal.h"

@interface _2_______Tests : XCTestCase

@end

@implementation _2_______Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//单元测试里面的方法必须以test开头，并且不能有返回值
- (void)testApp
{
    //1 + 1 = 2
    //1 + 0 = 1
    
    int sum = [Cal sum:-2 b:-1];
    
    XCTAssertTrue(sum == -3, @"");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
