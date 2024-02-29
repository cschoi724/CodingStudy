//
//  IntegerToRoman.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/22/24.
//
/// https://leetcode.com/problems/integer-to-roman/description/
/// 난이도: Medium
/// 로마 숫자는 I, V, X, L, C, D, M의 7가지 기호로 표현된다.
/// Symbol       Value
/// I                  1
/// V                 5
/// X                10
/// L                 50
/// C                100
/// D                500
/// M               1000
/// 예를 들어 로마 숫자에서 하나를 더하면 2가 II로 표기된다. 12는 XII로 표기되며, 이는 간단히 X + II이다. 숫자 27은 XX + V + II인 XXXVII로 표기된다.
/// 로마 숫자는 보통 왼쪽에서 오른쪽으로 가장 큰 것부터 가장 작은 것까지 표기한다. 그러나 4에 해당하는 숫자는 III가 아니다. 대신에 4는 IV로 표기된다.
/// 하나는 5를 빼기 전이므로 4가 된다. 같은 원리가 9에도 적용되며, 이것은 IX로 표기된다. 뺄셈이 사용되는 경우는 6가지가 있다:
/// - 나는 4와 9를 만들기 위해 V(5)와 X(10)보다 먼저 배치될 수 있다.
/// - X를 L(50)과 C(100) 앞에 배치하여 40과 90을 만들 수 있다.
/// - C를 D(500)와 M(1000)보다 먼저 배치하여 400과 900을 만들 수 있다.
/// 정수가 주어지면 이를 로마 숫자로 변환한다.
///
/// Constraints:
/// 1 <= num <= 3999
import Foundation

import XCTest
@testable import CodingTestStudy

final class IntegerToRoman: XCTestCase {
    
    /// 3개는 3개로 표현됩니다.
    func testCase1() throws {
        let num = 3
        let answer = "III"
        let solution = intToRoman(num)
        XCTAssertEqual(answer , solution)
    }
    
    /// L = 50, V = 5, III = 3.
    func testCase2() throws {
        let num = 58
        let answer = "LVIII"
        let solution = intToRoman(num)
        XCTAssertEqual(answer , solution)
    }
    
    /// M = 1000, CM = 900, XC = 90 and IV = 4.
    func testCase3() throws {
        let num = 1994
        let answer = "MCMXCIV"
        let solution = intToRoman(num)
        XCTAssertEqual(answer , solution)
    }
    
    /// 더 나은 결과
    func intToRoman(_ num: Int) -> String {
        var num = num
        let symbol =  ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let value = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        var result = ""
        
        while num > 0 {
            for row in value.enumerated() where num >= row.element {
                num -= row.element
                result += symbol[row.offset]
                break
            }
        }
        
        return result
    }
    /*
    func intToRoman(_ num: Int) -> String {
        var result: [String] = []
        var value = num
        
        while value > 0 {
            if value >= 1000 {
                result.append("M")
                value -= 1000
            } else if value >= 900 {
                result.append("CM")
                value -= 900
            } else if value >= 500 {
                result.append("D")
                value -= 500
            } else if value >= 400 {
                result.append("CD")
                value -= 400
            } else if value >= 100 {
                result.append("C")
                value -= 100
            } else if value >= 90 {
                result.append("XC")
                value -= 90
            } else if value >= 50 {
                result.append("L")
                value -= 50
            } else if value >= 40 {
                result.append("XL")
                value -= 40
            } else if value >= 10 {
                result.append("X")
                value -= 10
            } else if value >= 9 {
                result.append("IX")
                value -= 9
            } else if value >= 5 {
                result.append("V")
                value -= 5
            } else if value >= 4 {
                result.append("IV")
                value -= 4
            } else {
                result.append("I")
                value -= 1
            }
        }
        return result.joined()
    }*/
}
