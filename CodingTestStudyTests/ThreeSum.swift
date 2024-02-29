//
//  ThreeSum.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/27/24.
//
/// https://leetcode.com/problems/3sum/description/
/// 난이도: Medium
/// 정수 배열 숫자가 주어지면 i!=j, i!=k, j!=k가 되고, nums[i] + nums[j] + nums[k] == 0이 되도록 모든 삼중항 [nums[i]], nums[j] + nums[k]를 반환한다.
/// 솔루션 집합에 중복 삼중항이 포함되어서는 안 됩니다.
///
/// Constraints:
/// 3 <= nums.length <= 3000
/// -105 <= nums[i] <= 105
///
import Foundation

import XCTest
@testable import CodingTestStudy

final class ThreeSum: XCTestCase {
    
    /// nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
    /// nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
    /// nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
    /// 서로 다른 세쌍원소는 [-1,0,1]과 [-1, -1,2]이다.
    /// 출력의 순서와 세쌍원소의 순서는 중요하지 않다는 것에 주목하라.
    func testCase1() throws {
        let nums = [-1,0,1,2,-1,-4]
        let answer = [[-1,-1,2],[-1,0,1]]
        let solution = threeSum(nums)
        XCTAssertEqual(Set(answer) , Set(solution))
    }
    
    /// 가능한 유일한 삼중항은 합이 0이 되지 않는다.
    func testCase2() throws {
        let nums = [0,1,1]
        let answer: [[Int]] = []
        let solution = threeSum(nums)
        XCTAssertEqual(Set(answer) , Set(solution))
    }
    
    /// 가능한 유일한 삼중항의 합은 0이다.
    func testCase3() throws {
        let nums = [0,0,0]
        let answer = [[0,0,0]]
        let solution = threeSum(nums)
        XCTAssertEqual(Set(answer) , Set(solution))
    }
    
    func testCase4() throws {
        let nums = [3,0,-2,-1,1,2]
        ///[[-2,0,2],[-2,-1,3]]
        let answer = [[-2,-1,3],[-2,0,2],[-1,0,1]]
        let solution = threeSum(nums)
        XCTAssertEqual(Set(answer) , Set(solution))
    }
    
    /// 더나은 방법
    /// 정렬이 핵심
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result: [[Int]] = []
        for i in 0...(nums.count - 2) {
            var l = i + 1
            var r = nums.count - 1
            while l < r {
                let total = nums[i] + nums[l] + nums[r]
                if total < 0 {
                    l += 1
                } else if total > 0 {
                    r -= 1
                } else {
                    let array = [nums[i], nums[l], nums[r]]
                    result.append(array)
                    while l < r &&  array[1] == nums[l]{
                        l += 1
                    }
                }
            }
        }
        return result
    }
    
    /*func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: Set<[Int]> = []
        for row in nums.enumerated() {
            var colNums = nums
            colNums.removeSubrange(nums.startIndex...row.offset)
            for col in colNums.enumerated() {
                var dotNums = colNums
                dotNums.removeSubrange(colNums.startIndex...col.offset)
                for dot in dotNums.enumerated() {
                    let array = [row.element, col.element, dot.element]
                    let sum = array.reduce(0) { $0 + $1 }
                    if sum == 0 {
                        result.insert(array.sorted())
                    }
                }
            }
        }
        return Array(result)
    }*/
}
