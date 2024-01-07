//
//  바탕화면정리.swift
//  CodingTest
//
//  Created by dodor on 1/7/24.
//

import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var x: [Int] = [Int.max, 0]
    var y: [Int] = [Int.max, 0]
    
    for (ri,row) in wallpaper.enumerated() {
        if row.contains("#") {
            if ri < x[0] { x[0] = ri }
            if ri > x[1] { x[1] = ri }
    
            for (ci,column) in row.enumerated() {
                if column == "#" {
                    if ci < y[0] { y[0] = ci }
                    if ci > y[1] { y[1] = ci }
                }
            }
        }
    }
    
    return [x[0], y[0], x[1]+1, y[1]+1]
}
