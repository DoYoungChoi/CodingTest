//
//  전력망을둘로나누기.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func getNeighbors(by wires: [[Int]]) -> [Int: [Int]] {
    var result = [Int: [Int]]()
    for wire in wires {
        if result[wire[0]] != nil {
            result[wire[0]]!.append(wire[1])
        } else {
            result[wire[0]] = [wire[1]]
        }

        if result[wire[1]] != nil {
            result[wire[1]]!.append(wire[0])
        } else {
            result[wire[1]] = [wire[0]]
        }
    }
    return result
}

func getDiffCount(of wire: [Int], neighbors: [Int: [Int]]) -> Int {
    var pass = wire
    return abs(getNodeCount(of: wire[0], passed: [wire[1]], neighbors: neighbors) - getNodeCount(of: wire[1], passed: [wire[0]], neighbors: neighbors))
}

func getNodeCount(of me: Int, passed: [Int], neighbors: [Int: [Int]]) -> Int {
    if passed.contains(me) { return 0 }

    let copiedPass = passed + [me] // [1, 2, 3]
    var result = 0
    for neighbor in neighbors[me]! {
        if !copiedPass.contains(neighbor) {
            result += 1 // 나의 개수 세기
            result += getNodeCount(of: neighbor, passed: copiedPass, neighbors: neighbors)
        }
    }

    return result
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    let neighbors = getNeighbors(by: wires)
    let diffs = wires.map { getDiffCount(of: $0, neighbors: neighbors) }
    return diffs.min(by: { $0 < $1 })!
}
