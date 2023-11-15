//
//  올바른괄호.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ s: String) -> Bool
{
    var ans: Bool = true
    var container: [String] = []
    
    for character in s {
        if character == "(" {
            container.append(String(character))
        } else {
            if container.isEmpty {
                ans = false
                break
            }
            
            container.removeLast()
        }
    }
    
    if ans && !container.isEmpty {
        ans = false
    }
    
    return ans
}
