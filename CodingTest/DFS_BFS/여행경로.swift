//
//  여행경로.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    let (_, b) = dfs(departure: "ICN", path: ["ICN"], graph: tickets, targetCount: tickets.count + 1)
    return b
}

func dfs(departure: String, path: [String], graph: [[String]], targetCount: Int) -> (Bool, [String]) {
    if path.count == targetCount {
        return (true, path)
    }

    let tickets = graph.filter { $0[0] == departure }.sorted(by: { $0[1] < $1[1] })
    if tickets.isEmpty { return (false, []) }

    for ticket in tickets {
        let firstIndex = graph.firstIndex(where: { $0[0] == ticket[0] && $0[1] == ticket[1] })!
        var newGraph = graph
        newGraph.remove(at: firstIndex)
        let (result, array) = dfs(departure: ticket[1], path: path + [ticket[1]], graph: newGraph, targetCount: targetCount)
        if !result {
            continue
        } else {
            return (true, array)
        }
    }

    return (false, [])
}
