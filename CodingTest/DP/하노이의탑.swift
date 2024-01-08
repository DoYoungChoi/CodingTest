//
//  하노이의탑.swift
//  CodingTest
//
//  Created by dodor on 1/8/24.
//

import Foundation

func solution(_ n:Int) -> [[Int]] {
    return hanoi(start: 1, target: 3, temp: 2, n: n)
}

func hanoi(start: Int, target: Int, temp: Int, n: Int) -> [[Int]] {
    if n == 1 { return [[start, target]] }
    
    return hanoi(start: start, target: temp, temp: target, n: n-1)
    + [[start, target]]
    + hanoi(start: temp, target: target, temp: start, n: n-1)
}
