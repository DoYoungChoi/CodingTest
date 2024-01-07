//
//  가장큰정사각형찾기.swift
//  CodingTest
//
//  Created by dodor on 1/7/24.
//

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var answer:Int = 0
    var dp: [[Int]] = Array(
        repeating: Array(repeating: 0, count: board[0].count+1),
        count: board.count+1
    )

    for i in 1..<board.count+1 {
        for j in 1..<board[0].count+1 {
            if board[i-1][j-1] == 1 {
                dp[i][j] = [dp[i-1][j-1], dp[i-1][j], dp[i][j-1]].min()! + 1
            }
        }
    }
    
    var maxLength = dp.map { $0.max()! }.max()!
    return maxLength * maxLength
}
