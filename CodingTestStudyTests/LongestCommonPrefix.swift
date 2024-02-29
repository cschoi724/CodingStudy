//
//  LongestCommonPrefix.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/26/24.
//
/// https://leetcode.com/problems/longest-common-prefix/
/// 난이도: Easy
/// 일련의 문자열 중에서 가장 긴 공통 접두사 문자열을 찾는 함수를 작성하라.
/// 공통 접두사가 없으면 빈 문자열 " "을 반환합니다.
///
/// Constraints:
/// 1 <= strs.length <= 200
/// 0 <= strs[i].length <= 200
/// strs[i]는 소문자로만 구성되어 있다.
///
import Foundation

import XCTest
@testable import CodingTestStudy

final class LongestCommonPrefix: XCTestCase {
    
    func testCase1() throws {
        let strs = ["flower","flow","flight"]
        let answer = "fl"
        let solution = longestCommonPrefix(strs)
        XCTAssertEqual(answer , solution)
    }
    
    /// 입력 문자열 중 공통 접두사가 없습니다.
    func testCase2() throws {
        let strs = ["dog","racecar","car"]
        let answer = ""
        let solution = longestCommonPrefix(strs)
        XCTAssertEqual(answer , solution)
    }
    
    /// 입력 문자열 중 공통 접두사가 없습니다.
    func testCase3() throws {
        let strs = [""]
        let answer = ""
        let solution = longestCommonPrefix(strs)
        XCTAssertEqual(answer , solution)
    }
    
    /// 더나은 결과
    func longestCommonPrefix(_ strs: [String]) -> String {
        var result = strs[0]
        for str in strs {
            while str.hasPrefix(result) == false {
                result.removeLast()
            }
        }
        
        return result
    }
    
    /*
    func longestCommonPrefix(_ strs: [String]) -> String {
        var result = ""
        let min = strs.min { $0.count > $1.count } ?? ""
        guard min.isEmpty == false else { return result }
        for i in 1...min.count {
            let prefixes = strs.map { $0.prefix(i) }
            if prefixes.filter({ prefixes.first == $0 }).count == strs.count {
                result = String(prefixes.first ?? "")
            } else {
                return result
            }
        }
        return result
    }*/
}
