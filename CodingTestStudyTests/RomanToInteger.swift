//
//  RomanToInteger.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/23/24.
//
/// https://leetcode.com/problems/roman-to-integer/
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
/// 예를 들어 로마 숫자에서 2는 둘만 더하면 II로 표기된다. 12는 XII로 표기되며, 이는 간단히 X + II이다. 숫자 27은 XX + V + II인 XXXVII로 표기된다.
/// 로마 숫자는 보통 왼쪽에서 오른쪽으로 가장 큰 것부터 가장 작은 것까지 표기한다. 그러나 4에 해당하는 숫자는 III가 아니다. 대신에 4는 IV로 표기된다. 
/// 하나는 5를 빼기 전이므로 4가 된다. 같은 원리가 9에도 적용되며, 이것은 IX로 표기된다. 뺄셈이 사용되는 경우는 6가지가 있다:
/// 나는 4와 9를 만들기 위해 V(5)와 X(10)보다 먼저 배치될 수 있다.
/// X를 L(50)과 C(100) 앞에 배치하여 40과 90을 만들 수 있다.
/// C를 D(500)와 M(1000)보다 먼저 배치하여 400과 900을 만들 수 있다.
/// 로마 숫자가 주어지면 정수로 변환한다.
///
/// Constraints:
/// 1 <= s.length <= 15
/// s는 문자('I', 'V', 'X', 'L', 'C', 'D', 'M')만 포함한다.
/// s는 [1, 3999] 범위의 유효한 로마 숫자임이 보장된다.
///
import Foundation

import XCTest
@testable import CodingTestStudy

final class RomanToInteger: XCTestCase {
    
    /// 3개는 3개로 표현됩니다.
    func testCase1() throws {
        let s = "III"
        let answer = 3
        let solution = romanToInt(s)
        XCTAssertEqual(answer , solution)
    }
    
    /// L = 50, V = 5, III = 3.
    func testCase2() throws {
        let s = "LVIII"
        let answer = 58
        let solution = romanToInt(s)
        XCTAssertEqual(answer , solution)
    }
    
    /// M = 1000, CM = 900, XC = 90 and IV = 4.
    func testCase3() throws {
        let s = "MCMXCIV"
        let answer = 1994
        let solution = romanToInt(s)
        XCTAssertEqual(answer , solution)
    }
    
    func romanToInt(_ s: String) -> Int {
        var string = s
        let symbol =  ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let value = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        var result = 0
        
        for row in symbol.enumerated() {
            
            result += value[row.offset]
        }
        
        return result
    }
}
