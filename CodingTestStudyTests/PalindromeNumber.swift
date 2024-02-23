//
//  PalindromeNumber.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/22/24.
//
/// https://leetcode.com/problems/palindrome-number/description/
/// 난이도: Medium
/// Given an integer x, return true if x is a palindrome, and false otherwise.
/// 정수 x가 주어지면 x가 회문이면 true, 그렇지 않으면 false를 반환한다.
///
/// Constraints:
/// -2^31 <= x <= 2^31 - 1
///
import Foundation

import XCTest
@testable import CodingTestStudy

final class PalindromeNumber: XCTestCase {
    
    /// 121 reads as 121 from left to right and from right to left.
    /// 121은 왼쪽에서 오른쪽으로, 오른쪽에서 왼쪽으로 121로 읽힌다
    func testCase1() throws {
        let x = 121
        let answer = true
        let solution = isPalindrome(x)
        XCTAssertEqual(answer , solution)
    }
    
    /// From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
    /// 왼쪽에서 오른쪽으로 -121이라고 쓰여 있습니다. 오른쪽에서 왼쪽으로 121-이 됩니다. 따라서 회문이 아닙니다.
    func testCase2() throws {
        let x = -121
        let answer = false
        let solution = isPalindrome(x)
        XCTAssertEqual(answer , solution)
    }
    
    /// Reads 01 from right to left. Therefore it is not a palindrome.
    /// 01을 오른쪽에서 왼쪽으로 읽습니다. 따라서 회문이 아닙니다.
    func testCase3() throws {
        let x = 10
        let answer = false
        let solution = isPalindrome(x)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase4() throws {
        let x = 1000021
        let answer = false
        let solution = isPalindrome(x)
        XCTAssertEqual(answer , solution)
    }

    func isPalindrome(_ x: Int) -> Bool {
        var num = x
        var result = 0
        
        while ( num > 0 ) {
            result *= 10
            result += num % 10
            num /= 10
        }
        
        return result == x
    }
    
    /*
    func isPalindrome(_ x: Int) -> Bool {
        let string = String(x)
        var result = 0
        if string.first == "-" {
            return false
        }
        
        for char in string.enumerated() {
            let num = Int(String(char.element)) ?? 0
            result = result + Int(pow(10.0, Double(char.offset))) * num
        }
        
        return result == x
    }*/
}



