//
//  N개의최소공배수.swift
//  CodingTest
//
//  Created by dodor on 1/8/24.
//

import Foundation

func solution(_ arr:[Int]) -> Int {
    
    var arr = arr
    
    while arr.count > 1 {
        let a = arr.removeFirst()
        let b = arr.removeFirst()
        arr.append(lcm(a, b))
    }
    
    return arr[0]
}

func lcm(_ a: Int, _ b: Int) -> Int {
    var aMul: Int = 1
    var bMul: Int = 1
    
    while a * aMul != b * bMul {
        if a * aMul < b * bMul {
            aMul += 1
        } else {
            bMul += 1
        }
    }
    
    return a * aMul
}
