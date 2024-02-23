//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/15/24.
//
/// https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
/// 난이도: Medium
/// Given a string s, find the length of the longest substring without repeating characters.
/// 문자열이 주어졌을 때, 문자를 반복하지 않고 가장 긴 부분 문자열의 길이를 구하여라.
///
/// Constraints:
/// - 0 <= s.length <= 5 * 104
/// - s consists of English letters, digits, symbols and spaces.
/// - s는 영어 문자, 숫자, 기호 및 공백으로 구성됩니다.

import XCTest
@testable import CodingTestStudy

final class LongestSubstringWithoutRepeatingCharacters: XCTestCase {
    
    /// The answer is "abc", with the length of 3.
    func testCase1() throws {
        let input = "abcabcbb"
        let answer = 3
        let solution = lengthOfLongestSubstring(input)
        XCTAssertEqual(answer , solution)
    }
    
    /// The answer is "b", with the length of 1.
    func testCase2() throws {
        let input = "bbbbb"
        let answer = 1
        let solution = lengthOfLongestSubstring(input)
        XCTAssertEqual(answer , solution)
    }
    
    /// The answer is "wke", with the length of 3.
    /// Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
    func testCase3() throws {
        let input = "pwwkew"
        let answer = 3
        let solution = lengthOfLongestSubstring(input)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase4() throws {
        let input = " "
        let answer = 1
        let solution = lengthOfLongestSubstring(input)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase5() throws {
        let input = "dvdf"
        let answer = 3
        let solution = lengthOfLongestSubstring(input)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase6() throws {
        let input = "au"
        let answer = 2
        let solution = lengthOfLongestSubstring(input)
        XCTAssertEqual(answer , solution)
    }

    func lengthOfLongestSubstring(_ s: String) -> Int {
        var words: [String.Element: Int] = [:]
        var maxLength = 0
        var startIndex = 0
        for (endIndex, char) in s.enumerated() {
            if let index = words[char], index >= startIndex {
                startIndex = index + 1
            }
            
            words.updateValue(endIndex, forKey: char)
            maxLength = max(maxLength, endIndex - startIndex + 1)
        }
        return maxLength
    }
    
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var result = 0
        var word: [String.Element] = []
        var string = s
        for row in s.enumerated() {
            word.removeAll()
            word.append(row.element)
            string.removeFirst()
            for col in string.enumerated() {
                if word.contains(where: { $0 == col.element }) {
                    break
                }
                word.append(col.element)
            }
            result = max(result, word.count)
        }
        
        return result
    }
    
    /* 참고 
     func lengthOfLongestSubstring(_ s: String) -> Int {
        var characterIndexMap = [Int](repeating: -1, count: 256)
        var maxLength = 0
        var startIndex = 0
        for (endIndex, char) in s.utf8.enumerated() {
            let charIndex = Int(char)

            if characterIndexMap[charIndex] >= startIndex {
                startIndex = characterIndexMap[charIndex] + 1
            }

            characterIndexMap[charIndex] = endIndex

            maxLength = max(maxLength, endIndex - startIndex + 1)
        }

        return maxLength
    }*/
}
