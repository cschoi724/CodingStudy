//
//  TwoSum.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/14/24.
//
/// https://leetcode.com/problems/two-sum/
/// 난이도: Easy
/// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
/// You may assume that each input would have exactly one solution, and you may not use the same element twice.
/// You can return the answer in any order.
/// 정수수들의 배열과 정수 목표가 주어지면, 두 수가 목표에 더해질 수 있도록 지수들을 반환한다.
/// 각 입력은 정확히 하나의 해를 가질 것이라고 가정할 수 있으며, 동일한 요소를 두 번 사용하지 않을 수도 있다.
/// 어떤 순서로든 답을 돌려주시면 됩니다.
///
/// Constraints:
/// 2 <= nums.length <= 10^4
/// -10^9 <= nums[i] <= 10^9
/// -10^9 <= target <= 10^9
/// Only one valid answer exists.
/// 유효한 답이 하나만 있습니다.
///
import Foundation
import XCTest
@testable import CodingTestStudy

final class TwoSum: XCTestCase {
    
    /// Because nums[0] + nums[1] == 9, we return [0, 1].
    /// 수 [0] + 수 [1] == 9이므로 [0, 1]을 반환한다.
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
