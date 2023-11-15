//
//  가장큰수.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    var grouping: [String: [String]] = sameStartWords(words: numbers.map{ String($0) })
    var sortedGroup = grouping.sorted { $0.key > $1.key }
    
    var result = ""
    for (key, value) in sortedGroup {
        var words = value.sorted { $0 + $1 > $1 + $0 }
        for word in words {
            result += word
        }
    }
    
    if result[result.startIndex] == "0" {
        result = String(Int(result) ?? 0)
    }
    
    return result
}

func sameStartWords(words: [String]) -> [String: [String]] {
    var result: [String: [String]] = [:]
    
    for word in words {
        let startChar = String(word[word.startIndex])
        if result[startChar] != nil {
            result[startChar]!.append(word)
        } else {
            result[startChar] = [word]
        }
    }
    
    return result
}
