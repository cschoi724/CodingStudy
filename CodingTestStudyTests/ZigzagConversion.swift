//
//  ZigzagConversion.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/20/24.
//
/// https://leetcode.com/problems/zigzag-conversion/description/
/// 난이도: Medium
/// The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this
/// (you may want to display this pattern in a fixed font for better legibility)
/// 문자열 "PAYPALISHIRING"은 다음과 같이 주어진 수의 행에 지그재그 패턴으로 작성됩니다. 
/// (더 잘 읽기 위해 이 패턴을 고정된 글꼴로 표시하는 것이 좋습니다.)
/// P        A       H       N
/// A   P   L   S  I    I   G
/// Y        I        R
/// And then read line by line: "PAHNAPLSIIGYIR"
/// Write the code that will take a string and make this conversion given a number of rows:
/// 그리고 "PHNAPLSSIIGYIR"을 한 줄 한 줄 읽어보세요
/// 문자열을 사용할 코드를 작성하고 몇 개의 행이 주어지면 이 변환을 수행합니다:
///
/// Constraints:
/// 1 <= s.length <= 1000
/// s consists of English letters (lower-case and upper-case), ',' and '.'.
/// 1 <= numRows <= 1000
///
import Foundation

import XCTest
@testable import CodingTestStudy

final class ZigzagConversion: XCTestCase {
    
    //    P   A   H   N
    //    A P L S I I G
    //    Y   I   R
    func testCase1() throws {
        let s = "PAYPALISHIRING"
        let rows = 3
        let answer = "PAHNAPLSIIGYIR"
        let solution = convert(s,rows)
        XCTAssertEqual(answer , solution)
    }
    
    //Explanation:
    //P     I    N
    //A   L S  I G
    //Y A   H R
    //P     I
    func testCase2() throws {
        let s = "PAYPALISHIRING"
        let rows = 4
        let answer = "PINALSIGYAHRPI"
        let solution = convert(s,rows)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase3() throws {
        let s = "AB"
        let rows = 1
        let answer = "AB"
        let solution = convert(s,rows)
        XCTAssertEqual(answer , solution)
    }

    func convert(_ s: String, _ numRows: Int) -> String {
        var pattern: [String] = [String](repeating: "", count: numRows)
        var pointer = 0
        var direction = 1
        for row in s.enumerated() {
            pattern[pointer] += String(row.element)
            guard numRows > 1 else{
                continue
            }
            
            pointer += direction
            if pointer == 0 || pointer == (numRows - 1){
                direction *= -1
            }
        }
        return pattern.joined()
    }
}
