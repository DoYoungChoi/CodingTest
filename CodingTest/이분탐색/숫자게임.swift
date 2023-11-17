//
//  숫자게임.swift
//  CodingTest
//
//  Created by dodor on 11/17/23.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    var a = a.sorted(by: >)
    var b = b.sorted(by: >)
    
    for aNumber in a {
        var bIndex = b.firstIndex(where: { $0 <= aNumber })
        if let bIndex = bIndex {
            if bIndex > 0 {
                b.remove(at: bIndex - 1)
                result += 1
            }
        } else {
            b.removeLast()
            result += 1
        }
    }
    
    return result
}
