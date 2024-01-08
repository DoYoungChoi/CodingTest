//
//  최솟값만들기.swift
//  CodingTest
//
//  Created by dodor on 1/8/24.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var sortedA = A.sorted(by: <)
    var sortedB = B.sorted(by: >)
    
    return sortedA.enumerated()
    .map { $1 * sortedB[$0] }
    .reduce(0, +)
}
