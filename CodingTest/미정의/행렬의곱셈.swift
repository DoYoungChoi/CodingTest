//
//  행렬의곱셈.swift
//  CodingTest
//
//  Created by dodor on 1/8/24.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var result: [[Int]] = Array(
        repeating: Array(repeating: 0, count: arr2[0].count),
        count: arr1.count
    )
    
    for i in 0..<arr1.count {
        for j in 0..<arr2[0].count {
            let tmpArr = arr2.map { $0[j] }
            result[i][j] = arr1[i].enumerated()
            .map { $1 * tmpArr[$0] }
            .reduce(0, +)
        }
    }
    
    return result
}
