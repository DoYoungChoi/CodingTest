//
//  피로도.swift
//  CodingTest
//
//  Created by dodor on 11/16/23.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result: Int = 0
    
    dfs(
        k: k,
        dungeons: dungeons,
        visitCount: 0,
        maxVisit: &result
    )
    
    return result
}

func dfs(k: Int, dungeons: [[Int]], visitCount: Int, maxVisit: inout Int) {
    if k == 0 || dungeons.count == 0 { return }
    
    for (index, dungeon) in dungeons.enumerated() {
        if dungeon[0] <= k {
            var dungeons = dungeons
            dungeons.remove(at: index)
            if maxVisit < visitCount + 1 { maxVisit = visitCount + 1}
            dfs(
                k: k - dungeon[1],
                dungeons: dungeons,
                visitCount: visitCount + 1,
                maxVisit: &maxVisit
            )
        }
    }
}
