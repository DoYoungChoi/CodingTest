//
//  대충만든자판.swift
//  CodingTest
//
//  Created by dodor on 1/7/24.
//

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var dict: [Character: Int] = [:]
    
    keymap.forEach { keym in
        for (idx, key) in keym.enumerated() {
            if let ele = dict[key] {
                if idx + 1 < ele {
                    dict[key] = idx + 1
                }
            } else {
                dict[key] = idx + 1
            }
        }
    }
    
    return targets.map { target in
        var count: Int = 0
        for chr in target {
            if let keyCount = dict[chr] {
                count += keyCount
            } else {
                count = -1
                break
            }
        }
        return count
    }
}
