//
//  최댓값과최솟값.swift
//  CodingTest
//
//  Created by dodor on 1/8/24.
//

import Foundation

func solution(_ s:String) -> String {
    let array = s.split(separator: " ").map { Int($0)! }
    return [String(array.min()!), String(array.max()!)].joined(separator: " ")
}
