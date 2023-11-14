//: [Previous](@previous)

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var repre = computers.enumerated().map({ $0.offset })

    for i in 0..<n {
        for j in (i+1)..<n {
            if computers[i][j] == 1 {
                // UNION 전 FindSet으로 Representative 찾음
                // Representative가 다른 경우에 대해서만 처리
                // Representative가 같다면 이미 한 네트워크에 있다는 뜻
                // 더 작은 숫자를 Representative로 설정
                if repre[i] < repre[j] {
                    repre = repre.map { $0 == repre[j] ? repre[i] : $0 }
                } else if repre[i]  > repre[j] {
                    repre = repre.map { $0 == repre[i] ? repre[j] : $0 }
                }
            }
        }
    }

    return repre.enumerated().filter({ $0.offset == $0.element }).count
}
