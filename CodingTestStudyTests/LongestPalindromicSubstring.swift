//
//  LongestPalindromicSubstring.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/15/24.
//
/// https://leetcode.com/problems/longest-palindromic-substring/description/
/// 난이도: Medium
/// Given a string s, return the longest palindromic substring in s.
/// 문자열이 주어지면 가장 긴 회문성 하위 문자열을 반환합니다.
/// 문자열은 앞뒤로 같은 읽기를 하면 회문이다.
/// 부분 문자열(substring)은 문자열 내에 연속적으로 비어 있지 않은 문자 시퀀스이다.
///
/// Constraints:
/// - 1 <= s.length <= 1000
/// - s는 숫자와 영어문자로만 구성됩니다.
///
import XCTest
@testable import CodingTestStudy

final class LongestPalindromicSubstring: XCTestCase {
    /// Input: s = "babad"
    /// Output: "bab"
    /// Explanation: "aba" is also a valid answer.
    func testCase1() throws {
        let input = "babad"
        let answer = "bab"
        let solution = longestPalindrome(input)
        XCTAssertEqual(answer , solution)
    }
    
    /// Input: s = "cbbd"
    /// Output: "bb"
    func testCase2() throws {
        let input = "cbbd"
        let answer = "bb"
        let solution = longestPalindrome(input)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase3() throws {
        let input = "a"
        let answer = "a"
        let solution = longestPalindrome(input)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase4() throws {
        let input = "ccc"
        let answer = "ccc"
        let solution = longestPalindrome(input)
        XCTAssertEqual(answer , solution)
    }
    
    func longestPalindrome(_ s: String) -> String {
        var results: [String] = []        
        var string = s
        
        for row in s.enumerated() {
            var words: [String.Element] = []
            words.append(string.removeFirst())
            
            for col in string.enumerated() {
                if row.element == col.element,
                   words.last != col.element {
                    words.append(col.element)
                    break
                } else {
                    words.append(col.element)
                }
            }
            
            if row.element == words.last {
                results.append(String(words))
            }
        }
        
        return results.max { $0.count > $1.count } ?? ""
    }
    
    func find(_ s: String) -> String {
        var string = s
        let first = String(string.removeFirst())
        if let second = s.first {
            if first == String(second) {
                return first
            } else {
                return first + find(string)
            }
        } else {
            return first
        }
    }
    
    /*
    func longestPalindrome(_ s: String) -> String {
        var words: [String.Element] = []
        var word = ""
        var string = s
        for row in s.enumerated() {
            words.removeAll()
            words.append(row.element)
            string.removeFirst()
            
            for col in string.enumerated() {
                words.append(col.element)
                if row.element == col.element {
                    break
                }
            }
            
            if row.element == words.last {
                if words.count > word.count {
                    word = String(words)
                }
            }
        }
        
        return word
    }*/
    /*
    func longestPalindrome(_ s: String) -> String {
        var word = ""
        var words: [String.Element: Int] = [:]
        var maxLength = 0
        var startIndex = 0
        for (endIndex, char) in s.enumerated() {
            if let index = words[char], index >= startIndex {
                startIndex = index + 1
            }
            
            words.updateValue(endIndex, forKey: char)
            
            if endIndex - startIndex + 1 > maxLength {
                let initIndex = s.index(s.startIndex, offsetBy: startIndex)
                let stopIndex = s.index(s.startIndex, offsetBy: endIndex)
                word = String(s[initIndex...stopIndex])
                maxLength = endIndex - startIndex + 1
            }
        }
        
        return word
    }*/
}
