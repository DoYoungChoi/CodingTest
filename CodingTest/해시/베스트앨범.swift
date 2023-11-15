//
//  베스트앨범.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var totalPlays: [String: Int] = [:]
    var genreDict: [String: [[Int]]] = [:]
    // classic: [3, 800], [0, 500], totalPlays: 1450
    // pop: [4, 2500], [1, 600], totalPlays: 3100
    
    for (index, genre) in genres.enumerated() {
        let playCount = plays[index]
        if totalPlays[genre] != nil {
            totalPlays[genre]! += playCount
            var temp = genreDict[genre]!
            temp.append([index, playCount])
            temp.sort { $0[1] > $1[1] }
            if temp.count > 2 {
                temp.removeLast()
            }

            genreDict[genre] = temp
        } else {
            totalPlays[genre] = playCount
            genreDict[genre] = [[index, playCount]]
        }
    }
    
    var result = [Int]()
    totalPlays
        .sorted { $0.value > $1.value }
        .map { $0.key }
        .forEach { genreDict[$0]!.forEach { result.append($0[0]) } }
    
    return result
}
