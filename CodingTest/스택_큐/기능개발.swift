//
//  기능개발.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = []
    var copyProgresses = progresses
    var copySpeeds = speeds
    var count: Int = 0

    while (!copyProgresses.isEmpty) {
        guard let first = copyProgresses.first else { return result }
        var days = Int(ceil((100.0 - Float(first)) / (Float(copySpeeds[0]))))

        for index in 0..<copyProgresses.count {
            copyProgresses[index] += copySpeeds[index] * days
        }

        while (!copyProgresses.isEmpty && copyProgresses.first! >= 100) {
            count += 1
            copyProgresses.removeFirst()
            copySpeeds.removeFirst()
        }

        result.append(count)
        count = 0
    }

    return result
}
