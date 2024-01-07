//
//  다음큰숫자.swift
//  CodingTest
//
//  Created by dodor on 1/8/24.
//

import Foundation

func solution(_ n:Int) -> Int {
    var oneCount: Int = getOneCount(n)
    var nextBig: Int = n + 1
    
    while oneCount != getOneCount(nextBig) {
        nextBig += 1
    }
    
    return nextBig
}

func getOneCount(_ n: Int) -> Int {
    var count: Int = 0
    var n = n
    
    while n > 0 {
        let remain = n % 2
        if remain == 1 { count += 1 }
        n = n / 2
    }
    
    return count
}
