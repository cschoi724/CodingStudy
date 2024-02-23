//
//  RegularExpressionMatching.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/22/24.
//
/// https://leetcode.com/problems/regular-expression-matching/description/
/// 난이도: Hard
/// Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:
/// - '.' Matches any single character.
/// - '*' Matches zero or more of the preceding element.
/// The matching should cover the entire input string (not partial).
/// 입력 문자열과 패턴 p가 주어지면 '.'와 '*'를 지원하는 정규 표현식 일치를 구현합니다:
/// - ' . ' 모든 단일 문자와 일치합니다.
/// - ' * ' 이전 요소와 0 이상 일치합니다.
/// 매칭은 입력 문자열 전체를 커버해야 한다(부분적이지 않다).
///
/// Constraints:
/// - 1 <= s.length <= 20
/// - 1 <= p.length <= 20
/// - s contains only lowercase English letters.
/// - p contains only lowercase English letters, '.', and '*'.
/// - It is guaranteed for each appearance of the character '*', there will be a previous valid character to match.
/// - s는 소문자 영문자만 포함한다.
/// - p는 소문자와 '.'와 '*'만 포함합니다.
/// - 캐릭터 '*'의 각 등장마다 보장되며, 일치하는 이전 유효한 캐릭터가 있을 것입니다.
///
import Foundation

import XCTest
@testable import CodingTestStudy

final class RegularExpressionMatching: XCTestCase {
    
    /// "a" does not match the entire string "aa".
    /// "a"는 전체 문자열 "AA"와 일치하지 않습니다.
    func testCase1() throws {
        let s = "aa"
        let p = "a"
        let answer = false
        let solution = isMatch(s,p)
        XCTAssertEqual(answer , solution)
    }
    
    /// '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
    /// '*' 앞의 원소인 'a'의 0 이상을 의미한다. 따라서 'a'를 한 번 반복하면 'aa'가 된다.
    func testCase2() throws {
        let s = "aa"
        let p = "a*"
        let answer = true
        let solution = isMatch(s,p)
        XCTAssertEqual(answer , solution)
    }
    
    /// ".*" means "zero or more (*) of any character (.)".
    /// ".*" "모든 문자(.)의 0 이상(*)"을 의미합니다.
    func testCase3() throws {
        let s = "ab"
        let p = ".*"
        let answer = true
        let solution = isMatch(s,p)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase4() throws {
        let s = "abc"
        let p = "a***abc"
        let answer = true
        let solution = isMatch(s,p)
        XCTAssertEqual(answer , solution)
    }
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        var allPattern: [String] = []
        for char in p.enumerated() {
            if char.element == "." {
                
            } else if char.element == "*" {
                
            }
        }
        
        
        return false
    }
/*
    func isMatch(_ s: String, _ p: String) -> Bool {
        var pt: [String] = []
        var pre: String = ""
        for char in p.enumerated() {
            if pre == "*",
               pre == String(char.element) {
               continue
            } else {
                pt.append(String(char.element))
            }
            pre = String(char.element)
        }
        
        let pattern = "^\(pt.joined())$"
        if let range = s.range(of: pattern, options: .regularExpression) {
            return true
        } else {
            return false
        }
    }*/
}
