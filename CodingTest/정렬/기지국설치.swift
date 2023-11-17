//
//  기지국설치.swift
//  CodingTest
//
//  Created by dodor on 11/17/23.
//

import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int {
    var answer = 0
    var stations = stations.sorted(by: <)
    let width = 2 * w + 1
    
    var min = 1
    while !stations.isEmpty {
        var station = stations.removeFirst()
        var max = station - w
        var diff = max - min
        if diff > 0 {
            answer += diff / width
            if diff % width != 0 {
                answer += 1
            }
        }
        
        min = station + w + 1
    }
    
    if min <= n {
        answer += (n - min + 1) / width
        if (n - min + 1) % width != 0 {
            answer += 1
        }
    }

    return answer
}
