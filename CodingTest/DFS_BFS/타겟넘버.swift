//
//  타겟넘버.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = sum(array:[], numbers: numbers, target: target)
    return count
}

func sum(array: [Int], numbers: [Int], target: Int) -> Int {
    if array.count == numbers.count {
        if array.reduce(0) { $0 + $1 } == target {
            return 1
        } else {
            return 0
        }
    } else {
        var positive = sum(
            array: array + [numbers[array.count]],
            numbers: numbers,
            target: target
        )
        var negative = sum(
            array: array + [-numbers[array.count]],
            numbers: numbers,
            target: target
        )
        return positive + negative
    }
}
