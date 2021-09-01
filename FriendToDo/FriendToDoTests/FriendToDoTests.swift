//
//  FriendToDoTests.swift
//  FriendToDoTests
//
//  Created by Giuseppe Diciolla on 31/08/21.
//

import XCTest
@testable import FriendToDo

class FriendToDoRequirementsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetFriendsList_withSuccess(){
        
        var listFriends: [Friend] = []
        let expectedFriendsList: [Friend] = []
        
        listFriends = getFriendsList()
        
        XCTAssertFalse(listFriends, expectedFriendsList)
        
    }
    
    func testGetFriendsList_withFail(){
        
    }
    
    func testAddToDoTask_withSuccess(){
        
    }
    
    func testAddToDoTask_withFail(){
        
    }
    
    func testCancelToDoTask_withSuccess(){
        
    }
    
    func testCancelToDoTask_withFail(){
        
    }
    
    func testCompleteToDoTask_withSuccess(){
        
    }
    
    func testCompleteToDoTask_withFail(){
        
    }

}
