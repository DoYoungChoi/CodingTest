//
//  요격시스템.swift
//  CodingTest
//
//  Created by dodor on 1/7/24.
//

import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted(by: { $0[1] < $1[1] })
    var end = -1.0
    var count = 0
    
    for target in targets {
        if Double(target[0]) > end {
            count += 1
            end = Double(target[1]) - 0.1
        }
    }
    
    return count
}

let a = "23:59"
let formatter = DateFormatter()
formatter.dateFormat

