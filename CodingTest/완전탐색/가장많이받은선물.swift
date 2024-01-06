//
//  가장많이받은선물.swift
//  CodingTest
//
//  Created by dodor on 1/6/24.
//

import Foundation

extension String {
    func getPeople() -> (String, String) {
        let people = self.split(separator: " ")
        return (String(people[0]), String(people[1]))
    }
}

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var giftIndex: [Int] = friends.map { friend in
        var give: Int = 0
        var gett: Int = 0
        gifts.forEach {
            let (s, c) = $0.getPeople()
            if s == friend { give += 1 }
            else if c == friend { gett += 1 }
        }
        return give - gett
    }

    var giftCount: [Int] = Array(repeating: 0, count: friends.count)

    for i in 0..<friends.count-1 {
        for j in i+1..<friends.count {
            let I = friends[i]
            let J = friends[j]

            let ItoJ = gifts.filter({ $0 == "\(I) \(J)" }).count
            let JtoI = gifts.filter({ $0 == "\(J) \(I)" }).count
            if ItoJ > JtoI {
                giftCount[i] += 1
            } else if JtoI > ItoJ {
                giftCount[j] += 1
            } else {
                if giftIndex[i] > giftIndex[j] {
                    giftCount[i] += 1
                } else if giftIndex[j] > giftIndex[i] {
                    giftCount[j] += 1
                }
            }
        }
    }

    return giftCount.max()!
}
