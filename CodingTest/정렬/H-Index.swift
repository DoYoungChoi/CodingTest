//
//  H-Index.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    var hIndex: Int = -1
    var max = citations.max()!
    
    while hIndex <= max {
        hIndex += 1
        var higher = citations.filter { $0 >= hIndex }
        if higher.count < hIndex {
            hIndex -= 1
            break
        }
    }
    
    if hIndex < 0 { return 0 }
    return hIndex
}
