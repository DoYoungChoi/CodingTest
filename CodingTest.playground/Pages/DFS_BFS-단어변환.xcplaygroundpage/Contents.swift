//: [Previous](@previous)

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    
    var graph: [String: [String]] = [:]
    var visited: [String: Bool] = [:]
    var depth: [String: Int] = [:]

    graph[begin] = words.filter { compareWords(begin, and: $0) }
    visited[begin] = false
    depth[begin] = 0

    for word in words {
        graph[word] = words.filter { compareWords(word, and: $0) }
        visited[word] = false
        depth[word] = 0
    }

    var queue: [String] = [begin]
    while !queue.isEmpty {
        var pop = queue.removeFirst()
        for v in graph[pop]! {
            if !visited[v]! {
                queue.append(v)
                visited[v] = true
                depth[v] = depth[pop]! + 1
            }
        }
    }
    
    return depth[target]!
}

func compareWords(_ word1: String, and word2: String) -> Bool {
    if word1 == word2 { return false }
    
    for (idx, chr1) in word1.enumerated() {
        var word1R = word1
        var word2R = word2
        let chr2 = word2R.remove(at: word2R.index(word2R.startIndex, offsetBy: idx))
        word1R.remove(at: word1R.index(word1R.startIndex, offsetBy: idx))
        if chr1 != chr2 && word1R == word2R {
            return true
        }
    }

    return false
}
