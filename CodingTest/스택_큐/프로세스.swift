//
//  프로세스.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorities = priorities
    var location = location
    var result: Int = 0

    while location >= 0 {
        var target = priorities.removeFirst()

        var highPriority: Bool = false
        for comp in priorities {
            if comp > target {
                highPriority = true
                break
            }
        }


        if highPriority {
            priorities.append(target)
            if location == 0 {
                location = priorities.count
            }
        } else {
            result += 1
        }

        location -= 1
    }

    return result
}
