//
//  덧칠하기.swift
//  CodingTest
//
//  Created by dodor on 1/7/24.
//

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var section: [Int] = section
    var count: Int = 0
    var currentPaint: Int = 0
    
    while !section.isEmpty {
        var part = section.removeFirst()
        if currentPaint > part {
            continue
        } else {
            count += 1
            currentPaint = part + m
        }
    }
    
    return count
}
