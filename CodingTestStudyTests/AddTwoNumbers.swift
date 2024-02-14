//
//  AddTwoNumbers.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/14/24.
//

import XCTest
@testable import CodingTestStudy

final class AddTwoNumbers: XCTestCase {
    
    func testCase1() throws {
        let l1: ListNode = ListNode(2, ListNode(4, ListNode(3)))
        let l2: ListNode = ListNode(5, ListNode(6, ListNode(4)))
        let answer = ListNode(7, ListNode(0, ListNode(8)))
        let solution = addTwoNumbers(l1,l2)
                
        XCTAssertEqual(getNumber(answer) , getNumber(solution))
    }
    
    func testCase2() throws {
        let l1: ListNode = ListNode(0)
        let l2: ListNode = ListNode(0)
        let answer = ListNode(0)
        let solution = addTwoNumbers(l1,l2)
        
        XCTAssertEqual(getNumber(answer) , getNumber(solution))
    }
    
    func testCase3() throws {
        let l1: ListNode = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
        let l2: ListNode = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))
        let answer = ListNode(8, ListNode(9,ListNode(9,ListNode(9,ListNode(0,ListNode(0,ListNode(0, ListNode(1))))))))
        let solution = addTwoNumbers(l1,l2)
        XCTAssertEqual(getNumber(answer) , getNumber(solution))
    }
    
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var nextNode1: ListNode? = l1
        var nextNode2: ListNode? = l2
        var answerList: [ListNode] = []
        
        var digits: Int = 0
        while nextNode1 != nil || nextNode1 != nil {
            var value = digits
            if let node1 = nextNode1 {
                value += node1.val
                nextNode1 = node1.next
            }
            
            if let node2 = nextNode2 {
                value += node2.val
                nextNode2 = node2.next
            }
            
            if value / 10 > 0 {
                digits = Int(value / 10)
                answerList.append(ListNode(value % 10))
            } else {
                digits = 0
                answerList.append(ListNode(value))
            }
        }
        let initNode = answerList.removeFirst()
        let answerNode = answerList.reduce(initNode) { partialResult, node in
            partialResult.next = node
            return partialResult
        }
        
        return answerNode
    }
    
   /*func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let sum = getNumber(l1) + getNumber(l2)
        return getNode(sum)
    }*/
    
    func getNumber(_ ln: ListNode?) -> UInt64{
        if let node = ln {
            return UInt64(node.val) + (getNumber(ln?.next) * 10)
        } else {
            return 0
        }
    }
    
    func getNode(_ num: UInt64) -> ListNode?{
        let value = num / 10
        if value > 0 {
            return ListNode(Int(num) % 10, getNode(value))
        } else {
            return ListNode(Int(num) % 10)
        }
    }
}

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
