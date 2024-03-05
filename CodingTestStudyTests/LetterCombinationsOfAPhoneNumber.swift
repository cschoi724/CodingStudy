//
//  LetterCombinationsOfAPhoneNumber.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 3/4/24.
//
/// https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/
/// 난이도: Medium
/// 2-9개의 숫자를 포함하는 문자열이 주어졌을 때, 그 숫자가 나타낼 수 있는 모든 문자 조합을 반환하라. 임의의 순서로 답을 반환하라.
/// 전화 버튼과 마찬가지로 숫자를 문자로 표시한 지도가 아래에 나와 있다. 1은 어떤 문자와도 연결되지 않는다는 것에 유의하라.
/// 2: abc
/// 3: def
/// 4: ghi
/// 5: jkl
/// 6: mno
/// 7: pqrs
/// 8: tuv
/// 9: wxyz
///
/// Constraints:
/// 0 <= digits.length <= 4
/// digits[i]는 ['2', '9'] 범위의 숫자입니다.
///
import Foundation

import XCTest
@testable import CodingTestStudy

final class LetterCombinationsOfAPhoneNumber: XCTestCase {
    
    func testCase1() throws {
        let digits = "23"
        let answer = ["ad","ae","af","bd","be","bf","cd","ce","cf"]
        let solution = letterCombinations(digits)
        XCTAssertEqual(Set(answer) , Set(solution))
    }
    
    func testCase2() throws {
        let digits = ""
        let answer: [String] = []
        let solution = letterCombinations(digits)
        XCTAssertEqual(Set(answer) , Set(solution))
    }

    func testCas3() throws {
        let digits = "2"
        let answer = ["a","b","c"]
        let solution = letterCombinations(digits)
        XCTAssertEqual(Set(answer) , Set(solution))
    }
    
    /// 결국 풀지못하고 해답 참고함, 다시 풀어볼것
    func letterCombinations(_ digits: String) -> [String] {
        let dial = [
            "2": ["a","b","c"],
            "3": ["d","e","f"],
            "4": ["g","h","i"],
            "5": ["j","k","l"],
            "6": ["m","n","o"],
            "7": ["p","q","r","s"],
            "8": ["t","u","v"],
            "9": ["w","x","y","z"]
        ]
        var result: [String] = []
        
        for d in digits.map({ String($0) }) {
            let keys = dial[d]!
            if result.isEmpty {
                result = keys
                continue
            }
            
            let temp = result
            result.removeAll()
            for key in keys {
                result += temp.map { $0 + key }
            }
        }
        return result
    }
    
    /*
     
     let mat = [
         "2": ["a","b","c"],
         "3": ["d","e","f"],
         "4": ["g","h","i"],
         "5": ["j","k","l"],
         "6": ["m","n","o"],
         "7": ["p","q","r","s"],
         "8": ["t","u","v"],
         "9": ["w","x","y","z"]
     ]
     
    func letterCombinations(_ digits: String) -> [String] {
        var res = [String]()
        for d in digits.map({ $0.lowercased() }) {
            guard let keys = mat[d] else { break }
            if res.isEmpty {
                keys.forEach { res.append($0) }
                continue
            }
            let arr = res.map { _ in res.removeFirst() }
            for ch in keys {
                res += arr.map({$0 + ch})
            }
        }
        return res
    }*/
}

