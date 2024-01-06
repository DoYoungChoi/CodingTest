//
//  공원산책.swift
//  CodingTest
//
//  Created by dodor on 1/6/24.
//

import Foundation

extension String {
    func getDirectionAndCount() -> (String, Int) {
        let tmp = self.split(separator: " ")
        return (String(tmp[0]), Int(String(tmp[1]))!)
    }
}

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var width: Int = park[0].count
    var height: Int = park.count
    var current: [Int] = []
    for (index, row) in park.enumerated() {
        if row.contains("S") {
            let idx = row.firstIndex(of: "S")!
            let y = row.distance(from: row.startIndex, to: idx)
            current = [index, y]
            break
        }
    }
    
    for route in routes {
        let (direction, count) = route.getDirectionAndCount()
        if direction == "N" {
            if current[0] - count >= 0 {
                var abled: Bool = true
                for up in 1...count {
                    let blocks = park[current[0]-up]
                    let block = blocks.substring(from: current[1]).prefix(1)
                    if block == "X" {
                        abled = false
                        break
                    }
                }
                if abled {
                    current[0] = current[0] - count
                }
            }
        } else if direction == "S" {
            if current[0] + count < height {
                var abled: Bool = true
                for down in 1...count {
                    let blocks = park[current[0]+down]
                    let block = blocks.substring(from: current[1]).prefix(1)
                    if block == "X" {
                        abled = false
                        break
                    }
                }
                if abled {
                    current[0] = current[0] + count
                }
            }
        } else if direction == "W" {
            if current[1] - count >= 0 {
                var abled: Bool = true
                for lft in 1...count {
                    let blocks = park[current[0]]
                    let block = blocks.substring(from: current[1]-lft).prefix(1)
                    if block == "X" {
                        abled = false
                        break
                    }
                }
                if abled {
                    current[1] = current[1] - count
                }
            }
        } else if direction == "E" {
            if current[1] + count < width {
                var abled: Bool = true
                for rt in 1...count {
                    let blocks = park[current[0]]
                    let block = blocks.substring(from: current[1]+rt).prefix(1)
                    if block == "X" {
                        abled = false
                        break
                    }
                }
                if abled {
                    current[1] = current[1] + count
                }
            }
        }
    }
    
       return current
}
