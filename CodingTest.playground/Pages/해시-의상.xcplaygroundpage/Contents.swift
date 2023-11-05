//: [Previous](@previous)

import Foundation

func getCount(of clothes: [[String]]) -> [Int] {
    var dict: [String: [String]] = [:]
    
    for cloth in clothes {
        // guard cloth.count == 2 else { continue }
        if dict[cloth[1]] != nil {
            dict[cloth[1]]!.append(cloth[0])
        } else {
            dict[cloth[1]] = [cloth[0]]
        }
    }
    
    return dict.map { Array(Set($0.value)).count }
}

func solution(_ clothes: [[String]]) -> Int {
    var counts: [Int] = getCount(of: clothes)
    
    return counts.reduce(1) { $0 * ($1 + 1) } - 1
}
