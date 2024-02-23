//
//  MedianOfTwoSortedArrays.swift
//  CodingTestStudyTests
//
//  Created by cschoi on 2/15/24.
//
/// https://leetcode.com/problems/median-of-two-sorted-arrays/description/
/// 난이도: Hard
/// Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
/// The overall run time complexity should be O(log (m+n)).
/// 크기가 각각 m과 n인 정렬된 두 배열 1과 2가 주어지면, 정렬된 두 배열의 중위수를 반환한다.
/// 전체 런타임 복잡도는 O(log(m+n))이어야 한다.
///
/// Constraints:
/// - nums1.length == m
/// - nums2.length == n
/// - 0 <= m <= 1000
/// - 0 <= n <= 1000
/// - 1 <= m + n <= 2000
/// - -106 <= nums1[i], nums2[i] <= 106


import XCTest
@testable import CodingTestStudy

final class MedianOfTwoSortedArrays: XCTestCase {
    /// Input: nums1 = [1,3], nums2 = [2]
    /// Output: 2.00000
    /// Explanation: merged array = [1,2,3] and median is 2.
    func testCase1() throws {
        let nums1 = [1,3]
        let nums2 = [2]
        let answer = 2.0
        let solution = findMedianSortedArrays(nums1,nums2)
        XCTAssertEqual(answer , solution)
    }
    
    /// Input: nums1 = [1,2], nums2 = [3,4]
    /// Output: 2.50000
    /// Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
    func testCase2() throws {
        let nums1 = [1,2]
        let nums2 = [3,4]
        let answer = 2.5
        let solution = findMedianSortedArrays(nums1,nums2)
        XCTAssertEqual(answer , solution)
    }
    
    func testCase3() throws {
        let nums1 = [1,1]
        let nums2 = [1,2]
        let answer = 1.0
        let solution = findMedianSortedArrays(nums1,nums2)
        XCTAssertEqual(answer , solution)
    }
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let array = (nums1 + nums2).sorted()
        if array.count % 2 == 0 {
            let right = array[(array.count / 2) - 1]
            let left = array[array.count / 2]
            return Double(right + left) / 2
        } else {
            let index = Int(floor(Double(array.count) / 2.0))
            return Double(array[index])
        }
    }
}
