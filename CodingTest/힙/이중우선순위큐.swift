//
//  이중우선순위큐.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var maxHeap: [Int] = []
    
    for command in operations {
        if command == "D 1" {
            // 최댓값 삭제
            if maxHeap.count > 0 {
                maxHeap.removeFirst()
            }
        } else if command == "D -1" {
            // 최솟값 삭제
            if maxHeap.count > 0 {
                maxHeap.removeLast()
            }
        } else {
            // 숫자 삽입
            var command = command
            command.remove(at: command.startIndex)
            command.remove(at: command.startIndex)
            maxHeap.append(Int(command)!)
            maxHeap.sort(by: >)
        }
    }
    
    if maxHeap.isEmpty {
        return [0, 0]
    } else if maxHeap.count == 1 {
        return [maxHeap[0], maxHeap[0]]
    } else {
        return [maxHeap.removeFirst(), maxHeap.removeLast()]
    }
}
