//
//  달리기경주.swift
//  CodingTest
//
//  Created by dodor on 1/6/24.
//

import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var rankings: [Int: String] = [:]
    players.enumerated().forEach { rankings[$0] = $1 }
    
    for calling in callings {
        let rev = rankings.filter { $0.value == calling }.first!
        rankings[rev.key] = rankings[rev.key-1]!
        rankings[rev.key-1] = calling
    }
    
    return rankings.sorted(by: { $0.key < $1.key }).map { $0.value }
}
