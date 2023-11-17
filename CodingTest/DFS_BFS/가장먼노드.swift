//
//  가장먼노드.swift
//  CodingTest
//
//  Created by dodor on 11/17/23.
//

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    // BFS
    var queue: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: n)
    var depth: [Int] = Array(repeating: 0, count: n)
    var graph: [Int:[Int]] = getGraph(edge: edge, n: n)
    queue.append(1)
    visited[0] = true
    
    while !queue.isEmpty {
        var pop = queue.removeFirst()
        for node in graph[pop]! {
            if !visited[node-1] {
                depth[node-1] = depth[pop-1] + 1
                queue.append(node)
                visited[node-1] = true
            }
        }
    }
    
    var max = depth.max()!
    return depth.filter { $0 == max }.count
}

func getGraph(edge: [[Int]], n: Int) -> [Int:[Int]] {
    var result = [Int:[Int]]()
    for i in 0..<n {
        var vs = [Int]()
        var nodes = edge.filter { $0.contains(i+1) }
        nodes.forEach { vs.append(contentsOf: $0) }
        result[i+1] = vs.filter { $0 != i+1 }
    }
    return result
}

// 어떤 방법도 시간 초과!
func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    // BFS
    var queue: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: n)
    var depth: [Int] = Array(repeating: 0, count: n)
    var graph = edge
    queue.append(1)
    visited[0] = true
    
    while !queue.isEmpty {
        var pop = queue.removeFirst()
        var edges = graph.filter { $0.contains(pop) }
        graph.removeAll(where: { $0.contains(pop) })
        for edge in edges {
            for node in edge {
                if node == pop { continue }
                if !visited[node-1] {
                    depth[node-1] = depth[pop-1] + 1
                    queue.append(node)
                    visited[node-1] = true
                }
            }
        }
    }
    
    var max = depth.max()!
    return depth.filter { $0 == max }.count
}

func getGraph(edge: [[Int]], n: Int) -> [Int:[Int]] {
    var result = [Int:[Int]]()
    for i in 0..<n {
        var vs = [Int]()
        var nodes = edge.filter { $0.contains(i+1) }
        nodes.forEach { vs.append(contentsOf: $0) }
        result[i+1] = vs.filter { $0 != i+1 }
    }
    return result
}

