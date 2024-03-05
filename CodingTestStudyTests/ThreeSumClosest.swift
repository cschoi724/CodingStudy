//
//  ThreeSumClosest.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/29/24.
//
/// https://leetcode.com/problems/3sum-closest/description//
/// 난이도: Medium
/// 길이 n의 정수 배열 수와 정수 목표가 주어지면, 합이 목표에 가장 가깝게 되도록 숫자로 된 세 개의 정수를 구하여라.
/// 세 정수의 합을 반환한다.
/// 각 입력에는 단 하나의 해가 있을 것이라고 가정할 수 있다.
///
/// Constraints:
/// 3 <= nums.length <= 500
/// -1000 <= nums[i] <= 1000
/// -10^4 <= target <= 10^4
///
import Foundation

import XCTest
@testable import CodingTestStudy

final class ThreeSumClosest: XCTestCase {
    
    /// 표적에 가장 가까운 합은 2. (-1 + 2 + 1 = 2)이다.
    func testCase1() throws {
        let nums = [-1,2,1,-4]
        let target = 1
        let answer = 2
        let solution = threeSumClosest(nums, target)
        XCTAssertEqual(answer , solution)
    }
    
    /// 표적에 가장 가까운 합은 0. (0 + 0 + 0 = 0)입니다.
    func testCase2() throws {
        let nums = [0,0,0]
        let target = 1
        let answer = 0
        let solution = threeSumClosest(nums, target)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase3() throws {
        let nums = [-1000,-1000,-1000]
        let target = 1000
        let answer = -3000
        let solution = threeSumClosest(nums, target)
        XCTAssertEqual(answer , solution)
    }

    /// -4 -1 1 2
    /// -4 -1 2,  1  >  -3
    /// -4 1 2 , 1 > -1
    /// -1 1 2 , 1 < 2
    ///
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        var result = 0
        var diff = 0
        
        for i in 0...(nums.count - 2) {
            var l = i + 1
            var r = nums.count - 1
            
            while l < r {
                let sum = nums[i] + nums[l] + nums[r]
                if  diff > abs(target - sum) {
                    diff = abs(target - sum)
                    result = sum
                } else if diff == 0{
                    diff = abs(target - sum)
                    result = sum
                }
                
                if target < sum {
                    r -= 1
                } else if target > sum{
                    l += 1
                } else {
                    return sum
                }
            }
        }
        
        return result
    }
}
