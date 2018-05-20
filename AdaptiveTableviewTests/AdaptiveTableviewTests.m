//
//  AdaptiveTableviewTests.m
//  AdaptiveTableviewTests
//
//  Created by Sandeep Thakur on 21/05/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface AdaptiveTableviewTests : XCTestCase
@property (nonatomic) ViewController *vcToTest;
@end

@implementation AdaptiveTableviewTests

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.vcToTest = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    
    [self.vcToTest performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    self.vcToTest = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
#pragma mark - View loading tests
-(void)testThatViewLoads
{
    XCTAssertNotNil(self.vcToTest.view, @"View not initiated properly");
}

- (void)testParentViewHasTableViewSubview
{
    NSArray *subviews = self.vcToTest.view.subviews;
    XCTAssertTrue([subviews containsObject:self.vcToTest.adaptiveTableView], @"View does not have a table subview");
}

-(void)testThatTableViewLoads
{
    XCTAssertNotNil(self.vcToTest.adaptiveTableView, @"TableView not initiated");
}

#pragma mark - UITableView tests
- (void)testThatViewConformsToUITableViewDataSource
{
    XCTAssertTrue([self.vcToTest conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not conform to UITableView datasource protocol");
}

- (void)testThatTableViewHasDataSource
{
    XCTAssertNotNil(self.vcToTest.adaptiveTableView.dataSource, @"Table datasource cannot be nil");
}

- (void)testThatViewConformsToUITableViewDelegate
{
    XCTAssertTrue([self.vcToTest conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testTableViewIsConnectedToDelegate
{
    XCTAssertNotNil(self.vcToTest.adaptiveTableView.delegate, @"Table delegate cannot be nil");
}

- (void)testTableViewCellCreateCellsWithReuseIdentifier
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [self.vcToTest tableView:self.vcToTest.adaptiveTableView cellForRowAtIndexPath:indexPath];
    NSString *expectedReuseIdentifier = @"adaptiveCell";
    XCTAssertTrue([cell.reuseIdentifier isEqualToString:expectedReuseIdentifier], @"Table does not create reusable cells");
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
