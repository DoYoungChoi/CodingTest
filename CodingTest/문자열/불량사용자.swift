//
//  불량사용자.swift
//  CodingTest
//
//  Created by dodor on 11/17/23.
//

import Foundation

extension String {
    func substring(at offset: Int) -> String {
        var index = self.index(self.startIndex, offsetBy: offset)
        return String(self[index])
    }
}

func isContains(_ userId: String, of bannedId: String) -> Bool {
    if userId.count != bannedId.count { return false }
    for (i,bannedChar) in bannedId.enumerated() {
        if bannedChar == "*" { continue }
        if String(bannedChar) != userId.substring(at: i) { return false }
    }
    return true
}

func isSameArray(_ a: [String], _ b: [String]) -> Bool {
    if a.count != b.count { return false }
    var result = 0
    for aString in a {
        if b.contains(aString) { result += 1 }
    }
    return result == b.count
}

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var mapId: [String: [String]] = [:]

    for banned in Set(banned_id) {
        mapId[banned] = user_id.filter { isContains($0, of: banned) }
    }
    
    print("시작: \(mapId)")
    var combines: [[[String]]] = []
    for (index, banned) in banned_id.enumerated() {
        if index == 0 {
            combines.append(mapId[banned]!.map{[$0]})
        } else {
            var userIds = mapId[banned]!
            var prevCombs = combines[index - 1]
            var currentCombs: [[String]] = []
            for userId in userIds {
                for prev in prevCombs {
                    if !prev.contains(userId) {
                        let currentSet = prev + [userId]
                        //currentCombs에 prev + [userId]와 동일한 원소 구조를 가진 집합이 없는 경우 추가
                        if currentCombs.filter({ isSameArray(currentSet, $0) }).count < 1 {
                            currentCombs.append(currentSet)
                        }
                    }
                }
            }
            combines.append(currentCombs)
        }
    }
    
    var results = combines.removeLast()
    
    return results.count
}
