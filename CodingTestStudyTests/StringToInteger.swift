//
//  StringToInteger.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/21/24.
//
/// https://leetcode.com/problems/string-to-integer-atoi/
/// 난이도: Medium
/// Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).
/// The algorithm for myAtoi(string s) is as follows:
/// 1) Read in and ignore any leading whitespace.
/// 2) Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
/// 3) Read in next the characters until the next non-digit character or the end of the input is reached. The rest of the string is ignored.
/// 4) Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
/// 5) If the integer is out of the 32-bit signed integer range [-2^31, 2^31 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -2^31 should be clamped to -2^31, and integers greater than 2^31 - 1 should be clamped to 2^31 - 1.
/// 6) Return the integer as the final result.
///
/// Note:
/// Only the space character ' ' is considered a whitespace character.
/// Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.
///
/// 문자열을 32비트 부호 정수(C/C++의 아토이 함수와 유사)로 변환하는 myAtoi(strings) 함수를 구현한다.
/// 내 Atoi(스트링)의 알고리즘은 다음과 같다:
/// 1) 선두 공백을 읽고 무시하십시오.
/// 2) 다음 문자가 '-'인지 '+'인지 확인한다. 이 문자가 있으면 읽어라. 이것은 최종 결과가 음수인지 양수인지를 결정한다. 둘 다 없으면 결과가 양수라고 가정한다.
/// 3) 다음 숫자가 아닌 문자 또는 입력의 끝에 도달할 때까지 다음 문자를 읽습니다. 문자열의 나머지 부분은 무시됩니다.
/// 4) 이 숫자들을 정수(즉, "123" -> 123, "0032" -> 32)로 변환한다. 만약 숫자를 읽지 않았다면, 그 정수는 0이다. (2단계부터) 필요에 따라 부호를 변경한다.
/// 5)만약 그 정수가 32비트 부호 정수 범위[-2^31, 2^31 - 1]를 벗어나면 그 정수가 그 범위를 유지하도록 클램핑한다. 구체적으로 -2^31보다 작은 정수는 -2^31로 클램핑하고, 2^31 - 1보다 큰 정수는 2^31 - 1로 클램핑한다.
/// 6) 정수를 최종 결과로 반환합니다.
///
/// 참고:
/// 공백 문자 ' ' 만 공백 문자로 간주됩니다.
/// 선두 공백 또는 숫자 뒤에 있는 문자열의 나머지 문자를 무시하지 마십시오.
///
/// Constraints:
/// - 0 <= s.length <= 200
/// - s 영문자( 소문자 및 대문자), 숫자로 구성됩니다, digits (0-9), ' ', '+', '-', and '.'.
///
import Foundation

import XCTest
@testable import CodingTestStudy

final class StringToInteger: XCTestCase {
    
//    The underlined characters are what is read in, the caret is the current reader position.
//    Step 1: "42" (no characters read because there is no leading whitespace)
//             ^
//    Step 2: "42" (no characters read because there is neither a '-' nor '+')
//             ^
//    Step 3: "42" ("42" is read in)
//               ^
//    The parsed integer is 42.
//    Since 42 is in the range [-231, 231 - 1], the final result is 42.
    func testCase1() throws {
        let s = "42"
        let answer = 42
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
//    Step 1: "   -42" (가장 큰 공백은 읽고 무시함)
//                ^
//    Step 2: "   -42" ('-'를 읽으므로 결과가 음수여야 함)
//                 ^
//    Step 3: "   -42" ("42"는 에서 읽음))
//                   ^
//    구문 분석된 정수는 -42입니다.
//    -42가 [-2^31, 2^31 -1] 범위에 있으므로 최종 결과는 -42이다.
    func testCase2() throws {
        let s = "   -42"
        let answer = -42
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
//    Step 1: "4193 with words" (선두 공백이 없어 읽는 문자 없음)
//             ^
//    Step 2: "4193 with words" ('-'도 '+'도 없기 때문에 읽지 않는 문자)
//             ^
//    Step 3: "4193 with words" ("4193"을 읽습니다; 다음 문자가 숫자가 아닌 문자이기 때문에 읽기가 중지됨)
//                 ^
//    구문 분석된 정수는 4193입니다.
//    4193은 [-2^31, 2^31 - 1] 범위에 속하므로 최종 결과는 4193이다.
    func testCase3() throws {
        let s = "4193 with words"
        let answer = 4193
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase4() throws {
        let s = "words and 987"
        let answer = 0
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase5() throws {
        let s = "3.14159"
        let answer = 3
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase6() throws {
        let s = "-91283472332"
        let answer = -2147483648
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase7() throws {
        let s = "+-12"
        let answer = 0
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase8() throws {
        let s = "00000-42a1234"
        let answer = 0
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
    
    func testCase9() throws {
        let s = "-000000000000000000000000000000000000000000000000001"
        let answer = -1
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
    
    func testCase10() throws {
        let s = "   +0 123"
        let answer = 0
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase11() throws {
        let s = "20000000000000000000"
        let answer = 2147483647
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase12() throws {
        let s = "-5-"
        let answer = -5
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase13() throws {
        let s = "21474836460"
        let answer = 2147483647
        let solution = myAtoi(s)
        XCTAssertEqual(answer , solution)
    }
    
    func myAtoi(_ s: String) -> Int {
        var str = s.trimmingCharacters(in: .whitespaces)
        var sign = 1
        var result = 0
        
        if str.first == "+" || str.first == "-" {
            sign = str.removeFirst() == "-" ? -1 : 1
        }
        for char in str.enumerated() {
            if let digit = char.element.wholeNumberValue {
                result = result * 10 + digit
            } else {
                break
            }
            
            guard result <= Int32.max, result >= Int32.min else {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }
        }
        
        return result * sign
    }
    
    /*
    func myAtoi(_ s: String) -> Int {
        var array: [String] = []
        for row in s.trimmingCharacters(in: .whitespaces).enumerated() {
            let word = String(row.element)
            if word == "-" || word == "+" {
                if array.isEmpty {
                    array.append(word)
                } else {
                    break
                }
            } else if let num = Int(word) {
                array.append(word)
            } else {
                break
            }
        }
        
        let string = array.joined()
        if let result = Int(string) {
            if result >= Int32.max {
                return Int(Int32.max)
            } else if result <= Int32.min {
                return Int(Int32.min)
            } else {
                return result
            }
        } else {
            if string.count >= 19 {
                if string.first == "-" {
                    return Int(Int32.min)
                } else {
                    return Int(Int32.max)
                }
            } else {
                return 0
            }
        }
    }*/
}
