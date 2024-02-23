//
//  AddTwoNumbers.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/14/24.

/// https://leetcode.com/problems/add-two-numbers/description/
/// 난이도: Medium
/// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
/// You may assume the two numbers do not contain any leading zero, except the number 0 itself.
/// 당신에게는 음이 아닌 두 개의 정수를 나타내는 비어 있지 않은 연결된 목록이 두 개 주어진다. 각 숫자는 역순으로 저장되며 각 노드는 한 자릿수를 포함한다. 두 숫자를 더하고 그 합을 연결된 목록으로 반환한다.
/// 당신은 0이라는 숫자 자체를 제외하고는 두 숫자가 선행하는 0을 포함하지 않는다고 가정할 수 있다.
///
/// Constraints:
/// - 0 <= Node.val <= 9
/// - The number of nodes in each linked list is in the range [1, 100].
/// - It is guaranteed that the list represents a number that does not have leading zeros.
/// - 각 링크된 목록의 노드 수는 [1, 100] 범위 내에 있습니다.
/// - 리스트는 선행하는 0을 갖지 않는 숫자를 나타낸다는 것이 보장된다.

import XCTest
@testable import CodingTestStudy

final class AddTwoNumbers: XCTestCase {
    
    /// Input: l1 = [2,4,3], l2 = [5,6,4]
    /// Output: [7,0,8]
    /// Explanation: 342 + 465 = 807.
    func testCase1() throws {
        let l1: ListNode = ListNode(2, ListNode(4, ListNode(3)))
        let l2: ListNode = ListNode(5, ListNode(6, ListNode(4)))
        let answer = ListNode(7, ListNode(0, ListNode(8)))
        let solution = addTwoNumbers(l1,l2)
                
        XCTAssertEqual(getNumber(answer) , getNumber(solution))
    }
    
    /// Input: l1 = [0], l2 = [0]
    /// Output: [0]
    func testCase2() throws {
        let l1: ListNode = ListNode(0)
        let l2: ListNode = ListNode(0)
        let answer = ListNode(0)
        let solution = addTwoNumbers(l1,l2)
        
        XCTAssertEqual(getNumber(answer) , getNumber(solution))
    }
    
    /// Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
    /// Output: [8,9,9,9,0,0,0,1]
    func testCase3() throws {
        let l1: ListNode = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
        let l2: ListNode = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))
        let answer = ListNode(8, ListNode(9,ListNode(9,ListNode(9,ListNode(0,ListNode(0,ListNode(0, ListNode(1))))))))
        let solution = addTwoNumbers(l1,l2)
        XCTAssertEqual(getNumber(answer) , getNumber(solution))
    }

    // 첫번째 방법
    /*func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var nextNode1: ListNode? = l1
        var nextNode2: ListNode? = l2
        var answerList: [ListNode] = []
        var digits: Int = 0
        while nextNode1 != nil || nextNode2 != nil || digits > 0 {
            var value = digits
            if let node1 = nextNode1 {
                value += node1.val
                nextNode1 = node1.next
            }
            
            if let node2 = nextNode2 {
                value += node2.val
                nextNode2 = node2.next
            }
            
            if value >= 10 {
                digits = Int(value / 10)
                answerList.append(ListNode(value % 10))
            } else {
                digits = 0
                answerList.append(ListNode(value))
            }
        }
        for row in 0..<answerList.count {
            answerList[row].next = row+1 >= answerList.count ? nil : answerList[row+1]
        }
        
        return answerList.first
    }*/
    
    /// 두번째 방법
    var digit: Int = 0
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && digit == 0 {
            return nil
        } else {
            var sum = digit
            if let node1 = l1 {
                sum += node1.val
            }
            
            if let node2 = l2 {
                sum += node2.val
            }
            digit = sum / 10
            return ListNode(sum % 10, addTwoNumbers(l1?.next, l2?.next))
        }
    }
    
    func getNumber(_ ln: ListNode?) -> UInt64{
        if let node = ln {
            return UInt64(node.val) + (getNumber(ln?.next) * 10)
        } else {
            return 0
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
