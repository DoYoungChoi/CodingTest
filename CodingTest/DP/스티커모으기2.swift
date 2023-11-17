//
//  스티커모으기2.swift
//  CodingTest
//
//  Created by dodor on 11/17/23.
//

import Foundation

// 1) DP
func solution(_ sticker:[Int]) -> Int {
    if sticker.count == 1 { return sticker[0] }
    if sticker.count == 2 { return sticker.max()! }
    
    var useFirst: [Int] = Array(repeating: 0, count: sticker.count)
    var useSecond: [Int] = Array(repeating: 0, count: sticker.count)
    
    // 첫 번째 사용
    useFirst[0] = sticker[0]
    useFirst[1] = max(sticker[0], sticker[1])
    // 첫 번째 미사용
    useSecond[0] = 0
    useSecond[1] = sticker[1]
    for i in 2..<sticker.count {
        if i == sticker.count - 1 {
            useSecond[i] = max(useSecond[i-1], useSecond[i-2] + sticker[i])
        } else {
            useFirst[i] = max(useFirst[i-1], useFirst[i-2] + sticker[i])
            useSecond[i] = max(useSecond[i-1], useSecond[i-2] + sticker[i])
        }
    }
    
    return max( useFirst.max()!, useSecond.max()! )
}

// 2) DFS로 품 -> 시간 초과
func solution(_ sticker:[Int]) -> Int {
    var used: [Bool] = Array(repeating: false, count: sticker.count)
    var useFirst: [Int] = Array(repeating: 0, count: sticker.count)
    var useSecond: [Int] = Array(repeating: 0, count: sticker.count)
    
    // 0 사용 1 미사용
    used[0] = true
    let cand1 = dfs(
        sum: sticker[0],
        stickers: sticker,
        used: used,
        currentIndex: 2
    )
    // 0 미사용 1 사용
    used[0] = false
    used[1] = true
    let cand2 = dfs(
        sum: sticker[1],
        stickers: sticker,
        used: used,
        currentIndex: 2
    )
    // 0 미사용 0 미사용
    used[1] = false
    let cand3 = dfs(
        sum: 0,
        stickers: sticker,
        used: used,
        currentIndex: 2
    )
    
    return [cand1, cand2, cand3].max()!
}

func dfs(sum: Int, stickers: [Int], used: [Bool], currentIndex: Int) -> Int {
    if currentIndex == stickers.count { return sum }
    
    // 마지막 인덱스인 경우는 첫번째 사용여부에 따라서 결정
    if currentIndex == stickers.count - 1 {
        if used[0] {
            // 사용했으면 그냥 끝
            return sum
        } else {
            // 사용 안 했으면 앞 스티커 사용 안 한 경우는 무조건 사용
            if !used[currentIndex - 1] {
                   return dfs(
                    sum: sum + stickers[currentIndex],
                    stickers: stickers,
                    used: used,
                    currentIndex: currentIndex + 1
                )
            } else {
                return dfs(
                    sum: sum,
                    stickers: stickers,
                    used: used,
                    currentIndex: currentIndex + 1
                )
            }
        }
    } else {
        // 내꺼 앞의 결과에 따라서 할지 안 할지 선택
        if used[currentIndex - 1] {
            // 바로 앞 썼으니 지금꺼는 무조건 못 씀
            return dfs(
                sum: sum,
                stickers: stickers,
                used: used,
                currentIndex: currentIndex + 1
            )
        } else if !used[currentIndex - 2] {
            // 앞에 두 개 안 썼으면 지금꺼는 무조건 쓰는게 낭비가 아니겠지?
            var used = used
            used[currentIndex] = true
            return dfs(
                sum: sum + stickers[currentIndex],
                stickers: stickers,
                used: used,
                currentIndex: currentIndex + 1
            )
        } else {
            // 두 번째 앞은 썼고 바로 앞은 안 썼으므로 써도 되고 안 써도 되지만,
            // 이후 결과가 달라지므로 두 개 결과에 따라 더 큰 값을 내보낸다.
            // 안 쓴 예
            var sum1 = dfs(
                sum: sum,
                stickers: stickers,
                used: used,
                currentIndex: currentIndex + 1
            )
            
            // 쓴 예
            var used = used
            used[currentIndex] = true
            var sum2 = dfs(
                sum: sum + stickers[currentIndex],
                stickers: stickers,
                used: used,
                currentIndex: currentIndex + 1
            )
            
            return sum1 > sum2 ? sum1 : sum2
        }
    }
    
    
    return sum
}
