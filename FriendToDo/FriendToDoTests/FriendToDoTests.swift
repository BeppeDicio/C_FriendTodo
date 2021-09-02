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
    
    func testFriendsApiResultParsing(){
        
        //TODO:
        //Create a list Friend Obj you expect passing the Data to the parse method
        //Mock Data obj. that represent a valid api response
        //call: DataReciver.parseFreindApiResult(data), the method that parse the Data into the list FriendObj
        //Use the AssertEqual method to check the given list Freind Obj with the Expected one
        
    }
    
    func testFriendsTaskApiResultParsing(){
        //TODO:
        //Create a list ToDo Obj you expect passing the Data to the parse method
        //Mock Data obj. that represent a valid api response
        //call: DataReciver.parseFreindApiResult(data), the method that parse the Data into the list ToDo
        //Use the AssertEqual method to check the given list ToDo Obj with the Expected one
    }

}
