//
//  피보나치수.swift
//  CodingTest
//
//  Created by dodor on 1/8/24.
//

import Foundation

func solution(_ n:Int) -> Int {
    var fibo: [Int: Int] = [0: 0, 1: 1, 2: 1]
    
    for i in 3..<n+2 {
        fibo[i] = fibo[i-2]! + fibo[i-1]!
        fibo[i-2] = nil
    }
    
    return fibo[n]! % 1234567
}

func fibonacci(_ n: Int) -> Int {
    if n == 0 { return 0 }
    if n == 1 || n == 2 { return 1 }
    
    return fibonacci(n-2) + fibonacci(n-1)
}
