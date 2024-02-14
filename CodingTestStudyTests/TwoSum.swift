//
//  TwoSum.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/14/24.
//  https://leetcode.com/problems/two-sum/

import Foundation
import XCTest
@testable import CodingTestStudy

final class TwoSum: XCTestCase {
    
    func testCase1() throws {
        let nums: [Int] = [2,7,11,15]
        let target = 9
        let answer = [0,1]
        
        XCTAssertEqual(answer, solution(nums, target))
    }
    
    func testCase2() throws {
        let nums: [Int] = [3,2,4]
        let target = 6
        let answer = [1,2]
        
        XCTAssertEqual(answer, solution(nums, target))
    }
    
    func testCase3() throws {
        let nums: [Int] = [3,3]
        let target = 6
        let answer = [0,1]
        
        XCTAssertEqual(answer, solution(nums, target))
    }

    func testCase4() throws {
        let nums: [Int] = [3,2,3]
        let target = 6
        let answer = [0,2]
        
        XCTAssertEqual(answer, solution(nums, target))
    }
    
    func solution(_ nums: [Int], _ target: Int) -> [Int] {
        return nums.enumerated().filter { num in
            var subnums = nums
            subnums.remove(at: num.offset)
            return subnums.contains { subnum in
                num.element + subnum == target
            }
        }.map { $0.offset }
    }
}
