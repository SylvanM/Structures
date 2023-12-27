//
//  LinkedListTests.swift
//  
//
//  Created by Sylvan Martin on 12/26/23.
//

import XCTest
import Structures

final class LinkedListTests: XCTestCase {

    func testExample() throws {
        
        var ll: LinkedList<Int> = []
        
        XCTAssert(ll.isEmpty)
        XCTAssertEqual(ll.description, "Empty Linked List")
        XCTAssertEqual(ll.count, 0)
        
        XCTAssertNil(ll.pop())
        
        ll.push(1)
        XCTAssertFalse(ll.isEmpty)
        XCTAssertEqual(ll.count, 1)
        
        XCTAssertEqual(ll.pop(), 1)
        XCTAssert(ll.isEmpty)
        
        ll.push(0)
        ll.push(1)
        ll.push(2)
        ll.push(3)
        
        let correctVals = [3, 2, 1, 0]
        
        XCTAssertEqual(correctVals.count, ll.count)
        
        for i in 0..<correctVals.count {
            XCTAssertEqual(correctVals[i], ll[i])
        }
        
        XCTAssertEqual(ll.pop(), 3)
        
        ll = [1, 2, 0, 4, 9]
        
        XCTAssertEqual(ll.endIndex, 4)
        
        XCTAssert(ll.contains(1))
        XCTAssert(ll.contains(2))
        XCTAssert(ll.contains(0))
        XCTAssert(ll.contains(4))
        XCTAssert(ll.contains(9))
        
        XCTAssertEqual(ll.pop(), 1)
        XCTAssertFalse(ll.contains(1))
        
        XCTAssertEqual(ll.pop(), 2)
        XCTAssertEqual(ll.pop(), 0)
        XCTAssertEqual(ll.pop(), 4)
        XCTAssertEqual(ll.pop(), 9)
        
        XCTAssert(ll.isEmpty)
        
        XCTAssertFalse(ll.contains(1))
        XCTAssertFalse(ll.contains(2))
        XCTAssertFalse(ll.contains(0))
        XCTAssertFalse(ll.contains(4))
        XCTAssertFalse(ll.contains(9))
    }
    
}
