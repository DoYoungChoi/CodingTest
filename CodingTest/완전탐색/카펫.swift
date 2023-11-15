//
//  카펫.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var sumOfRowNCol: Int = (brown + 4) / 2
    var multipleOfRowNCol: Int = (yellow - 4) + 2 * sumOfRowNCol

    for num in 1..<multipleOfRowNCol {
        let other = sumOfRowNCol - num
        // 곱이 같은지 확인
        if num * other == multipleOfRowNCol {
            return [other, num]
        }
    }

    return []
}
