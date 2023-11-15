//
//  최소직사각형.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var width: Int = sizes.first![0]
    var height: Int = sizes.first![1]

    for idx in 1..<sizes.count {
        let temp1 = sizes[idx][0]
        let temp2 = sizes[idx][1]

        if width >= temp1 && height >= temp2 {
            continue
        }

        let w1 = width >= temp1 ? width : temp1
        let h1 = height >= temp2 ? height : temp2

        let w2 = width >= temp2 ? width : temp2
        let h2 = height >= temp1 ? height : temp1

        if w1 * h1 <= w2 * h2 {
            width = w1
            height = h1
        } else {
            width = w2
            height = h2
        }
    }

    return width * height
}
