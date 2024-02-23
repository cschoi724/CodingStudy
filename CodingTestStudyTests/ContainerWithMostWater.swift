//
//  ContainerWithMostWater.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/22/24.
//
/// https://leetcode.com/problems/container-with-most-water/description/
/// 난이도: Medium
/// You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
/// Find two lines that together with the x-axis form a container, such that the container contains the most water.
/// Return the maximum amount of water a container can store.
/// Notice that you may not slant the container.
/// 길이 n의 정수배열 높이가 주어진다. i번째 선의 두 끝점이 (i, 0)과 (i, high[i])이 되도록 그려지는 수직선은 n개이다.
/// x축과 함께 용기를 구성하는 두 개의 선이 용기에 가장 많은 물이 담기도록 구하여라.
/// 용기가 저장할 수 있는 최대 물의 양을 반환합니다.
/// 용기를 기울이면 안 됩니다.
///
/// Constraints:
/// n == height.length
/// 2 <= n <= 10^5
/// 0 <= height[i] <= 10^4
import Foundation

import XCTest
@testable import CodingTestStudy

final class ContainerWithMostWater: XCTestCase {
    
    /// 상기 수직선들은 배열[1,8,6,2,5,4,8,3,7]로 표시된다. 이 경우, 용기가 수용할 수 있는 물의 최대 면적(파란색 섹션)은 49이다.
    func testCase1() throws {
        /// 1 2 3 4 5 6 7 8 9
        /// 12 6 20 16 40 18 49
        /// 4 15 12 32 15 42
        let height = [1,8,6,2,5,4,8,3,7]
        let answer = 49
        let solution = maxArea(height)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase2() throws {
        let height = [1,1]
        let answer = 1
        let solution = maxArea(height)
        XCTAssertEqual(answer , solution)
    }
    
    func maxArea(_ height: [Int]) -> Int {
        var result: Int = 0
        var left = 0
        var right = height.count - 1
    
        while left != right {
            if height[left] <= height[right] {
                result = max(result, height[left] * (right - left))
                left += 1
            } else {
                result = max(result, height[right] * (right - left))
                right -= 1
            }
        }
        return result
    }
    
    /*
    func maxArea(_ height: [Int]) -> Int {
        var area: [Int] = []
        var hs = height
        while hs.count > 0 {
            let h = hs.removeFirst()
            for row in hs.enumerated() {
                if row.element >= h {
                    area.append(h * (row.offset + 1))
                } else {
                    area.append(row.element * (row.offset + 1))
                }
            }
        }
        
        return area.max() ?? 0
    }*/
}
