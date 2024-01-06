//
//  추억점수.swift
//  CodingTest
//
//  Created by dodor on 1/6/24.
//

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var result: [Int] = []
    var scores: [String: Int] = [:]
    name.enumerated().forEach {
        scores[$1] = yearning[$0]
    }
    
    result = photo.map { people in
        var total = 0
        people.forEach {
            if let score = scores[$0] {
                total += score
            }
        }
        return total
    }
    
    return result
}
