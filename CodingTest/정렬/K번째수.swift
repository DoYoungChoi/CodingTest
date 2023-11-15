//
//  K번째수.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    for command in commands {
        var array = array[(command[0]-1)..<command[1]].sorted(by: <)
        result.append(array[command[2]-1])
    }
    
    return result
}
