//
//  ReverseInteger.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/20/24.
//
/// https://leetcode.com/problems/reverse-integer/description/
/// 난이도: Medium
/// Given a signed 32-bit integer x, return x with its digits reversed. 
/// If reversing x causes the value to go outside the signed 32-bit integer range [-2^31, 2^31 - 1], then return 0.
/// Assume the environment does not allow you to store 64-bit integers (signed or unsigned).
/// 부호가 있는 32비트 정수 x가 주어지면 x를 그 자리의 숫자를 반대로 반환한다.
/// 만약 x를 반대로 하면 그 값이 부호가 있는 32비트 정수 범위[-2^31, 2^31 - 1] 밖으로 나온다면 0을 반환한다.
/// 환경에서 64비트 정수(서명 또는 서명되지 않음)를 저장할 수 없다고 가정합니다.
///
/// Constraints:
/// -2^31 <= x <= 2^31 - 1
///
import Foundation

import XCTest
@testable import CodingTestStudy

final class ReverseInteger: XCTestCase {
    
    func testCase1() throws {
        let x = 123
        let answer = 321
        let solution = reverse(x)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase2() throws {
        let x = -123
        let answer = -321
        let solution = reverse(x)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase3() throws {
        let x = 120
        let answer = 21
        let solution = reverse(x)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase4() throws {
        let x = 1534236469
        let answer = 0
        let solution = reverse(x)
        XCTAssertEqual(answer , solution)
    }

    func reverse(_ x: Int) -> Int {
        let dir = x < 0 ? -1 : 1
        let value = String(Int(abs(x)))
        
        let result = value.enumerated().reduce(0) { result, next in
            let num = Int(String(next.element)) ?? 0
            let digits: Int = Int( pow(10.0, Double(next.offset)) )
            return result + (num * digits)
        }
        
        if result > Int32.max {
            return 0
        } else {
            return result * dir
        }
    }
}
